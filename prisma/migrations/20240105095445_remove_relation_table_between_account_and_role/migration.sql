/*
  Warnings:

  - You are about to drop the `account_role` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `role_id` to the `account` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "account_role" DROP CONSTRAINT "account_role_global_account_id_fkey";

-- DropForeignKey
ALTER TABLE "account_role" DROP CONSTRAINT "account_role_role_id_fkey";

-- AlterTable
ALTER TABLE "account" ADD COLUMN     "role_id" SMALLINT NOT NULL;

-- DropTable
DROP TABLE "account_role";

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;
