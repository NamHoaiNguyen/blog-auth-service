/*
  Warnings:

  - You are about to drop the column `general_scope_id` on the `inner_scope` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "inner_scope" DROP CONSTRAINT "inner_scope_general_scope_id_fkey";

-- AlterTable
ALTER TABLE "inner_scope" DROP COLUMN "general_scope_id";
