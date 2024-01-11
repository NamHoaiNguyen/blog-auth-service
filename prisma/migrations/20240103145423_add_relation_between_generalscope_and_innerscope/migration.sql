/*
  Warnings:

  - Added the required column `general_scope_id` to the `inner_scope` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "inner_scope" ADD COLUMN     "general_scope_id" SMALLINT NOT NULL;

-- AddForeignKey
ALTER TABLE "inner_scope" ADD CONSTRAINT "inner_scope_general_scope_id_fkey" FOREIGN KEY ("general_scope_id") REFERENCES "general_scope"("general_scope_id") ON DELETE CASCADE ON UPDATE CASCADE;
