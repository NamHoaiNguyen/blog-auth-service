/*
  Warnings:

  - You are about to drop the column `algorithm` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `global_account_id` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `kong_credential_key` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `private_key` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `public_key` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `refresh_token_id` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `scope` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `access_token` table. All the data in the column will be lost.
  - You are about to drop the column `algorithm` on the `refresh_token` table. All the data in the column will be lost.
  - You are about to drop the column `global_account_id` on the `refresh_token` table. All the data in the column will be lost.
  - You are about to drop the column `kong_credential_key` on the `refresh_token` table. All the data in the column will be lost.
  - You are about to drop the column `private_key` on the `refresh_token` table. All the data in the column will be lost.
  - You are about to drop the column `public_key` on the `refresh_token` table. All the data in the column will be lost.
  - You are about to drop the column `type` on the `refresh_token` table. All the data in the column will be lost.
  - You are about to drop the `account` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `general_scope` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `inner_scope` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `module` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `role` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `is_still_validated` to the `access_token` table without a default value. This is not possible if the table is not empty.
  - Added the required column `is_still_validated` to the `refresh_token` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "access_token" DROP CONSTRAINT "access_token_global_account_id_fkey";

-- DropForeignKey
ALTER TABLE "access_token" DROP CONSTRAINT "access_token_refresh_token_id_fkey";

-- DropForeignKey
ALTER TABLE "account" DROP CONSTRAINT "account_role_id_fkey";

-- DropForeignKey
ALTER TABLE "general_scope" DROP CONSTRAINT "general_scope_module_id_fkey";

-- DropForeignKey
ALTER TABLE "general_scope" DROP CONSTRAINT "general_scope_role_id_fkey";

-- DropForeignKey
ALTER TABLE "inner_scope" DROP CONSTRAINT "inner_scope_role_id_fkey";

-- DropForeignKey
ALTER TABLE "refresh_token" DROP CONSTRAINT "refresh_token_global_account_id_fkey";

-- DropIndex
DROP INDEX "access_token_global_account_id_key";

-- DropIndex
DROP INDEX "refresh_token_global_account_id_key";

-- AlterTable
ALTER TABLE "access_token" DROP COLUMN "algorithm",
DROP COLUMN "global_account_id",
DROP COLUMN "kong_credential_key",
DROP COLUMN "private_key",
DROP COLUMN "public_key",
DROP COLUMN "refresh_token_id",
DROP COLUMN "scope",
DROP COLUMN "type",
ADD COLUMN     "is_still_validated" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "refresh_token" DROP COLUMN "algorithm",
DROP COLUMN "global_account_id",
DROP COLUMN "kong_credential_key",
DROP COLUMN "private_key",
DROP COLUMN "public_key",
DROP COLUMN "type",
ADD COLUMN     "is_still_validated" BOOLEAN NOT NULL;

-- DropTable
DROP TABLE "account";

-- DropTable
DROP TABLE "general_scope";

-- DropTable
DROP TABLE "inner_scope";

-- DropTable
DROP TABLE "module";

-- DropTable
DROP TABLE "role";
