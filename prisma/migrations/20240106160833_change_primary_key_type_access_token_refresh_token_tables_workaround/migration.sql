/*
  Warnings:

  - The primary key for the `access_token` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `access_token_id` on the `access_token` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.
  - The primary key for the `refresh_token` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `refresh_token_id` on the `refresh_token` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `Integer`.

*/
-- AlterTable
ALTER TABLE "access_token" DROP CONSTRAINT "access_token_pkey",
ALTER COLUMN "access_token_id" DROP DEFAULT,
ALTER COLUMN "access_token_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "access_token_pkey" PRIMARY KEY ("access_token_id");
DROP SEQUENCE "access_token_access_token_id_seq";

-- AlterTable
ALTER TABLE "refresh_token" DROP CONSTRAINT "refresh_token_pkey",
ALTER COLUMN "refresh_token_id" DROP DEFAULT,
ALTER COLUMN "refresh_token_id" SET DATA TYPE INTEGER,
ADD CONSTRAINT "refresh_token_pkey" PRIMARY KEY ("refresh_token_id");
DROP SEQUENCE "refresh_token_refresh_token_id_seq";
