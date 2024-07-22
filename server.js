const express = require("express");
const { createServer } = require("http");
const { Server } = require("socket.io");
const { PrismaClient } = require("@prisma/client");
require("dotenv").config();

const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: `${PORT_CLIENT}`, // lắng nghe port 3001
    methods: ["GET", "POST"],
  },
});

const prisma = new PrismaClient();
// connect to db
async function main() {
  try {
    await prisma.$connect();
    console.log("Connected to database");
  } catch (error) {
    console.error("Database connection error:", error);
    process.exit(1);
  }
}

main();

io.on("connection", (socket) => {
  //khi mở port 3001 trang messenger thì sẽ connect
  console.log(`${socket.id} đã truy cập`);

  socket.on("chatGroup", async (msg) => {
    // ssocket.on lắng nghe  còn socket.emit là gọi
    console.log("Received group message:", msg);

    try {
      const chat = await prisma.chat.findUnique({
        where: { name: msg.room },
      });

      if (!chat) {
        console.error(`Chat with name ${msg.room} not found.`);
        return;
      }

      const savedMessage = await prisma.message.create({
        data: {
          content: msg.text,
          student: { connect: { studentCode: msg.sender } },
          chat: { connect: { id: chat.id } },
        },
      });

      io.to(msg.room).emit("chatGroup", { ...msg, id: savedMessage.id });
    } catch (error) {
      console.error("Error saving group message:", error);
    }
  });

  socket.on("privateMessage", async (msg) => {
    console.log("Received private message:", msg);

    try {
      const senderId = msg.sender;
      const receiverId = msg.receiver;
      const roomName = [senderId, receiverId].sort().join("_");

      let chat = await prisma.chat.findUnique({
        where: { name: roomName },
      });

      if (!chat) {
        chat = await prisma.chat.create({
          data: {
            name: roomName,
            students: {
              connect: [{ studentCode: senderId }, { studentCode: receiverId }],
            },
          },
        });
      }

      const savedMessage = await prisma.message.create({
        data: {
          content: msg.text,
          student: { connect: { studentCode: senderId } },
          chat: { connect: { id: chat.id } },
        },
      });

      socket.emit("privateMessage", { ...msg, id: savedMessage.id });
      socket
        .to(roomName)
        .emit("privateMessage", { ...msg, id: savedMessage.id });

      console.log(`Sent message to ${senderId} and ${receiverId}`);
    } catch (error) {
      console.error("Error saving private message:", error);
    }
  });

  socket.on("joinRoom", async (roomName, studentCode) => {
    socket.join(roomName);
    console.log(`${socket.id} (${studentCode}) đã tham gia phòng ${roomName}`);

    try {
      let chat = await prisma.chat.findUnique({
        where: { name: roomName },
      });

      if (!chat) {
        chat = await prisma.chat.create({
          data: {
            name: roomName,
            students: {
              connect: { studentCode: studentCode },
            },
          },
        });
      } else {
        await prisma.chat.update({
          where: { id: chat.id },
          data: {
            students: {
              connect: { studentCode: studentCode },
            },
          },
        });
      }

      console.log(
        `${studentCode} đã được thêm vào chat ${roomName} trong database`
      );
    } catch (error) {
      console.error("Error adding user to chat room:", error);
    }
  });

  socket.on("disconnect", () => {
    console.log(`${socket.id} đã ngắt kết nối`);
  });
});

const PORT = process.env.PORT || 3002;
httpServer.listen(PORT, () => {
  console.log(`Server đang chạy trên cổng ${PORT}`);
});
