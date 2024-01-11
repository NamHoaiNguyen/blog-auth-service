/*
  Warnings:

  - You are about to drop the `module_role` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "module_role" DROP CONSTRAINT "module_role_module_id_fkey";

-- DropForeignKey
ALTER TABLE "module_role" DROP CONSTRAINT "module_role_role_id_fkey";

-- DropTable
DROP TABLE "module_role";
