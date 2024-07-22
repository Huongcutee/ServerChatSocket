-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE');

-- CreateEnum
CREATE TYPE "GradeType" AS ENUM ('GPA', 'CGPA');

-- CreateEnum
CREATE TYPE "CertificateType" AS ENUM ('IELTS', 'TOEFL');

-- CreateEnum
CREATE TYPE "DegreeType" AS ENUM ('HIGHSCHOOL', 'UNIVERSITY');

-- CreateEnum
CREATE TYPE "StudentStatus" AS ENUM ('STUDYING', 'DROPPED', 'AWAITING', 'APPROVED');

-- CreateEnum
CREATE TYPE "ProfileStatus" AS ENUM ('ONLINE', 'OFFLINE', 'IDLE', 'BUSY', 'INVISIBLE');

-- CreateEnum
CREATE TYPE "PostStatus" AS ENUM ('PUBLIC', 'PRIVATE', 'FRIENDS', 'EXCEPT');

-- CreateEnum
CREATE TYPE "SocialType" AS ENUM ('YOUTUBE', 'FACEBOOK', 'INSTAGRAM', 'TIKTOK', 'TWITCH', 'TWITTER', 'PORTFOLLIO');

-- CreateEnum
CREATE TYPE "NewsType" AS ENUM ('ANNOUNCEMENT', 'EVENT', 'BLOG');

-- CreateEnum
CREATE TYPE "Country" AS ENUM ('AUSTRALIA', 'KOREA', 'CANADA');

-- CreateEnum
CREATE TYPE "ContactTitle" AS ENUM ('FEEDBACK', 'SYSTEM', 'REFUND', 'BILLING', 'SUBSCRIPTION', 'SCHOLARSHIP', 'PROCEDURE');

-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "emailVerified" TIMESTAMP(3),
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "dob" TIMESTAMP(3) NOT NULL,
    "gender" "Gender" NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "idCardNumber" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "image" TEXT,
    "isLocked" BOOLEAN NOT NULL DEFAULT false,
    "isTwoFactorEnabled" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "VerificationToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PasswordResetToken" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PasswordResetToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TwoFactorToken" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TwoFactorToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TwoFactorConfirmation" (
    "id" TEXT NOT NULL,
    "accountId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TwoFactorConfirmation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "School" (
    "id" TEXT NOT NULL,
    "logo" TEXT NOT NULL,
    "background" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "short" TEXT,
    "description" TEXT,
    "history" TEXT,
    "color" TEXT NOT NULL,
    "isPublished" BOOLEAN NOT NULL DEFAULT false,
    "country" "Country" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "School_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolScholarship" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "cover" TEXT,
    "isPublished" BOOLEAN NOT NULL DEFAULT false,
    "schoolId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SchoolScholarship_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolScholarshipImage" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "scholarshipId" TEXT NOT NULL,

    CONSTRAINT "SchoolScholarshipImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StudentSchoolScholarship" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "scholarshipId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentSchoolScholarship_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolGallery" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "schoolId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SchoolGallery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolGalleryImage" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "galleryId" TEXT NOT NULL,

    CONSTRAINT "SchoolGalleryImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolLocation" (
    "id" TEXT NOT NULL,
    "cover" TEXT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "isMain" BOOLEAN NOT NULL DEFAULT false,
    "schoolId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SchoolLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolLocationImage" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "locationId" TEXT NOT NULL,

    CONSTRAINT "SchoolLocationImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolLocationContact" (
    "id" TEXT NOT NULL,
    "phone" TEXT,
    "hours" TEXT,
    "fax" TEXT,
    "email" TEXT,
    "url" TEXT,
    "locationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SchoolLocationContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolProgram" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "cover" TEXT,
    "isPublished" BOOLEAN NOT NULL DEFAULT false,
    "schoolId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SchoolProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SchoolProgramImage" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "programId" TEXT NOT NULL,

    CONSTRAINT "SchoolProgramImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StudentSchoolProgram" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "programId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentSchoolProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StudentSchoolLocation" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "locationId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentSchoolLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Student" (
    "id" TEXT NOT NULL,
    "studentCode" TEXT,
    "degreeType" "DegreeType" NOT NULL,
    "certificateType" "CertificateType" NOT NULL,
    "certificateImg" TEXT NOT NULL,
    "gradeType" "GradeType" NOT NULL,
    "gradeScore" DOUBLE PRECISION NOT NULL,
    "cover" TEXT,
    "additional" TEXT,
    "status" "StudentStatus" NOT NULL DEFAULT 'AWAITING',
    "accountId" TEXT NOT NULL,
    "schoolId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chat" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "creatAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Chat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Message" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "studentCode" TEXT NOT NULL,
    "chatId" TEXT NOT NULL,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "hostId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EventProfile" (
    "id" TEXT NOT NULL,
    "eventId" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EventProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" TEXT NOT NULL,
    "status" "ProfileStatus" NOT NULL DEFAULT 'ONLINE',
    "studentId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileFriend" (
    "id" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT false,
    "profileIdOne" TEXT NOT NULL,
    "profileIdTwo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProfileFriend_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Area" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Area_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileBiography" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProfileBiography_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileBiographyArea" (
    "id" TEXT NOT NULL,
    "biographyId" TEXT NOT NULL,
    "areaId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProfileBiographyArea_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileBiographySocial" (
    "id" TEXT NOT NULL,
    "type" "SocialType" NOT NULL,
    "href" TEXT NOT NULL,
    "profileBiographyId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProfileBiographySocial_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileBlog" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT,
    "profileId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProfileBlog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileBlogImage" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "profileBlogId" TEXT NOT NULL,

    CONSTRAINT "ProfileBlogImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" TEXT NOT NULL,
    "content" TEXT,
    "status" "PostStatus" NOT NULL DEFAULT 'PUBLIC',
    "isArchived" BOOLEAN NOT NULL DEFAULT false,
    "profileId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostImage" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "postId" TEXT NOT NULL,

    CONSTRAINT "PostImage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostLike" (
    "id" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "postId" TEXT NOT NULL,

    CONSTRAINT "PostLike_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostShare" (
    "id" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "postId" TEXT NOT NULL,

    CONSTRAINT "PostShare_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostSave" (
    "id" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "postId" TEXT NOT NULL,

    CONSTRAINT "PostSave_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostComment" (
    "id" TEXT NOT NULL,
    "content" TEXT,
    "image" TEXT,
    "isArchived" BOOLEAN NOT NULL DEFAULT false,
    "profileId" TEXT NOT NULL,
    "postId" TEXT NOT NULL,
    "parentCommentId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PostComment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostCommentLike" (
    "id" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "postCommentId" TEXT NOT NULL,

    CONSTRAINT "PostCommentLike_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Group" (
    "id" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProfileGroup" (
    "id" TEXT NOT NULL,
    "profileId" TEXT NOT NULL,
    "groupId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProfileGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "News" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT,
    "type" "NewsType" NOT NULL,
    "cover" TEXT NOT NULL,
    "isPublished" BOOLEAN NOT NULL DEFAULT true,
    "schoolId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "News_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "type" "NewsType" NOT NULL,
    "isRead" BOOLEAN NOT NULL,
    "studentId" TEXT NOT NULL,
    "fromId" TEXT,
    "newsId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StudentFollow" (
    "id" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "followerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StudentFollow_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contact" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "title" "ContactTitle" NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "isRead" BOOLEAN NOT NULL DEFAULT false,
    "schoolId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ChatParticipants" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Account_email_key" ON "Account"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Account_idCardNumber_key" ON "Account"("idCardNumber");

-- CreateIndex
CREATE INDEX "Account_name_idx" ON "Account"("name");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_email_token_key" ON "VerificationToken"("email", "token");

-- CreateIndex
CREATE UNIQUE INDEX "PasswordResetToken_token_key" ON "PasswordResetToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "PasswordResetToken_email_token_key" ON "PasswordResetToken"("email", "token");

-- CreateIndex
CREATE UNIQUE INDEX "TwoFactorToken_token_key" ON "TwoFactorToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "TwoFactorToken_email_token_key" ON "TwoFactorToken"("email", "token");

-- CreateIndex
CREATE UNIQUE INDEX "TwoFactorConfirmation_accountId_key" ON "TwoFactorConfirmation"("accountId");

-- CreateIndex
CREATE UNIQUE INDEX "School_name_key" ON "School"("name");

-- CreateIndex
CREATE UNIQUE INDEX "SchoolScholarship_schoolId_name_key" ON "SchoolScholarship"("schoolId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "StudentSchoolScholarship_studentId_key" ON "StudentSchoolScholarship"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "StudentSchoolScholarship_studentId_scholarshipId_key" ON "StudentSchoolScholarship"("studentId", "scholarshipId");

-- CreateIndex
CREATE INDEX "SchoolGallery_name_idx" ON "SchoolGallery"("name");

-- CreateIndex
CREATE UNIQUE INDEX "SchoolLocation_name_key" ON "SchoolLocation"("name");

-- CreateIndex
CREATE UNIQUE INDEX "SchoolLocation_address_key" ON "SchoolLocation"("address");

-- CreateIndex
CREATE UNIQUE INDEX "SchoolProgram_schoolId_name_key" ON "SchoolProgram"("schoolId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "StudentSchoolProgram_studentId_key" ON "StudentSchoolProgram"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "StudentSchoolProgram_studentId_programId_key" ON "StudentSchoolProgram"("studentId", "programId");

-- CreateIndex
CREATE UNIQUE INDEX "StudentSchoolLocation_studentId_key" ON "StudentSchoolLocation"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "StudentSchoolLocation_studentId_locationId_key" ON "StudentSchoolLocation"("studentId", "locationId");

-- CreateIndex
CREATE UNIQUE INDEX "Student_studentCode_key" ON "Student"("studentCode");

-- CreateIndex
CREATE UNIQUE INDEX "Student_accountId_key" ON "Student"("accountId");

-- CreateIndex
CREATE UNIQUE INDEX "Chat_name_key" ON "Chat"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Event_hostId_key" ON "Event"("hostId");

-- CreateIndex
CREATE UNIQUE INDEX "EventProfile_eventId_profileId_key" ON "EventProfile"("eventId", "profileId");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_studentId_key" ON "Profile"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileFriend_profileIdOne_key" ON "ProfileFriend"("profileIdOne");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileFriend_profileIdTwo_key" ON "ProfileFriend"("profileIdTwo");

-- CreateIndex
CREATE UNIQUE INDEX "Area_title_key" ON "Area"("title");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileBiography_profileId_key" ON "ProfileBiography"("profileId");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileBiographyArea_biographyId_areaId_key" ON "ProfileBiographyArea"("biographyId", "areaId");

-- CreateIndex
CREATE INDEX "ProfileBiographySocial_type_idx" ON "ProfileBiographySocial"("type");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileBiographySocial_type_href_key" ON "ProfileBiographySocial"("type", "href");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileBlog_profileId_key" ON "ProfileBlog"("profileId");

-- CreateIndex
CREATE INDEX "ProfileBlog_title_idx" ON "ProfileBlog"("title");

-- CreateIndex
CREATE INDEX "Post_status_idx" ON "Post"("status");

-- CreateIndex
CREATE UNIQUE INDEX "PostLike_profileId_postId_key" ON "PostLike"("profileId", "postId");

-- CreateIndex
CREATE UNIQUE INDEX "PostShare_profileId_postId_key" ON "PostShare"("profileId", "postId");

-- CreateIndex
CREATE UNIQUE INDEX "PostSave_profileId_postId_key" ON "PostSave"("profileId", "postId");

-- CreateIndex
CREATE INDEX "PostComment_isArchived_idx" ON "PostComment"("isArchived");

-- CreateIndex
CREATE UNIQUE INDEX "PostCommentLike_profileId_postCommentId_key" ON "PostCommentLike"("profileId", "postCommentId");

-- CreateIndex
CREATE UNIQUE INDEX "ProfileGroup_profileId_groupId_key" ON "ProfileGroup"("profileId", "groupId");

-- CreateIndex
CREATE INDEX "News_title_idx" ON "News"("title");

-- CreateIndex
CREATE UNIQUE INDEX "StudentFollow_studentId_followerId_key" ON "StudentFollow"("studentId", "followerId");

-- CreateIndex
CREATE UNIQUE INDEX "_ChatParticipants_AB_unique" ON "_ChatParticipants"("A", "B");

-- CreateIndex
CREATE INDEX "_ChatParticipants_B_index" ON "_ChatParticipants"("B");

-- AddForeignKey
ALTER TABLE "TwoFactorConfirmation" ADD CONSTRAINT "TwoFactorConfirmation_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "Account"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolScholarship" ADD CONSTRAINT "SchoolScholarship_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolScholarshipImage" ADD CONSTRAINT "SchoolScholarshipImage_scholarshipId_fkey" FOREIGN KEY ("scholarshipId") REFERENCES "SchoolScholarship"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentSchoolScholarship" ADD CONSTRAINT "StudentSchoolScholarship_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentSchoolScholarship" ADD CONSTRAINT "StudentSchoolScholarship_scholarshipId_fkey" FOREIGN KEY ("scholarshipId") REFERENCES "SchoolScholarship"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolGallery" ADD CONSTRAINT "SchoolGallery_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolGalleryImage" ADD CONSTRAINT "SchoolGalleryImage_galleryId_fkey" FOREIGN KEY ("galleryId") REFERENCES "SchoolGallery"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolLocation" ADD CONSTRAINT "SchoolLocation_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolLocationImage" ADD CONSTRAINT "SchoolLocationImage_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "SchoolLocation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolLocationContact" ADD CONSTRAINT "SchoolLocationContact_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "SchoolLocation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolProgram" ADD CONSTRAINT "SchoolProgram_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SchoolProgramImage" ADD CONSTRAINT "SchoolProgramImage_programId_fkey" FOREIGN KEY ("programId") REFERENCES "SchoolProgram"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentSchoolProgram" ADD CONSTRAINT "StudentSchoolProgram_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentSchoolProgram" ADD CONSTRAINT "StudentSchoolProgram_programId_fkey" FOREIGN KEY ("programId") REFERENCES "SchoolProgram"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentSchoolLocation" ADD CONSTRAINT "StudentSchoolLocation_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentSchoolLocation" ADD CONSTRAINT "StudentSchoolLocation_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "SchoolLocation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_accountId_fkey" FOREIGN KEY ("accountId") REFERENCES "Account"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_studentCode_fkey" FOREIGN KEY ("studentCode") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_hostId_fkey" FOREIGN KEY ("hostId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventProfile" ADD CONSTRAINT "EventProfile_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EventProfile" ADD CONSTRAINT "EventProfile_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileFriend" ADD CONSTRAINT "ProfileFriend_profileIdOne_fkey" FOREIGN KEY ("profileIdOne") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileFriend" ADD CONSTRAINT "ProfileFriend_profileIdTwo_fkey" FOREIGN KEY ("profileIdTwo") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileBiography" ADD CONSTRAINT "ProfileBiography_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileBiographyArea" ADD CONSTRAINT "ProfileBiographyArea_biographyId_fkey" FOREIGN KEY ("biographyId") REFERENCES "ProfileBiography"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileBiographyArea" ADD CONSTRAINT "ProfileBiographyArea_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "Area"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileBiographySocial" ADD CONSTRAINT "ProfileBiographySocial_profileBiographyId_fkey" FOREIGN KEY ("profileBiographyId") REFERENCES "ProfileBiography"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileBlog" ADD CONSTRAINT "ProfileBlog_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileBlogImage" ADD CONSTRAINT "ProfileBlogImage_profileBlogId_fkey" FOREIGN KEY ("profileBlogId") REFERENCES "ProfileBlog"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostImage" ADD CONSTRAINT "PostImage_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostLike" ADD CONSTRAINT "PostLike_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostLike" ADD CONSTRAINT "PostLike_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostShare" ADD CONSTRAINT "PostShare_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostShare" ADD CONSTRAINT "PostShare_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostSave" ADD CONSTRAINT "PostSave_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostSave" ADD CONSTRAINT "PostSave_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostComment" ADD CONSTRAINT "PostComment_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostComment" ADD CONSTRAINT "PostComment_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostComment" ADD CONSTRAINT "PostComment_parentCommentId_fkey" FOREIGN KEY ("parentCommentId") REFERENCES "PostComment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostCommentLike" ADD CONSTRAINT "PostCommentLike_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostCommentLike" ADD CONSTRAINT "PostCommentLike_postCommentId_fkey" FOREIGN KEY ("postCommentId") REFERENCES "PostComment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileGroup" ADD CONSTRAINT "ProfileGroup_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProfileGroup" ADD CONSTRAINT "ProfileGroup_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "News" ADD CONSTRAINT "News_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_fromId_fkey" FOREIGN KEY ("fromId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_newsId_fkey" FOREIGN KEY ("newsId") REFERENCES "News"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentFollow" ADD CONSTRAINT "StudentFollow_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentFollow" ADD CONSTRAINT "StudentFollow_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChatParticipants" ADD CONSTRAINT "_ChatParticipants_A_fkey" FOREIGN KEY ("A") REFERENCES "Chat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChatParticipants" ADD CONSTRAINT "_ChatParticipants_B_fkey" FOREIGN KEY ("B") REFERENCES "Student"("id") ON DELETE CASCADE ON UPDATE CASCADE;
