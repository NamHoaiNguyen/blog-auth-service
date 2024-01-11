/*
  Warnings:

  - The primary key for the `access_token` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `access_token` table. All the data in the column will be lost.
  - The primary key for the `refresh_token` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `refresh_token` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "access_token" DROP CONSTRAINT "access_token_refresh_token_id_fkey";

-- AlterTable
ALTER TABLE "access_token" DROP CONSTRAINT "access_token_pkey",
DROP COLUMN "id",
ADD COLUMN     "access_token_id" BIGSERIAL NOT NULL,
ADD CONSTRAINT "access_token_pkey" PRIMARY KEY ("access_token_id");

-- AlterTable
ALTER TABLE "refresh_token" DROP CONSTRAINT "refresh_token_pkey",
DROP COLUMN "id",
ADD COLUMN     "refresh_token_id" BIGSERIAL NOT NULL,
ADD CONSTRAINT "refresh_token_pkey" PRIMARY KEY ("refresh_token_id");

-- AddForeignKey
ALTER TABLE "access_token" ADD CONSTRAINT "access_token_refresh_token_id_fkey" FOREIGN KEY ("refresh_token_id") REFERENCES "refresh_token"("refresh_token_id") ON DELETE CASCADE ON UPDATE CASCADE;
