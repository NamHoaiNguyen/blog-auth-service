-- AlterTable
ALTER TABLE "general_scope" ALTER COLUMN "scope_description" DROP NOT NULL;

-- AlterTable
ALTER TABLE "inner_scope" ALTER COLUMN "scope_description" DROP NOT NULL;

-- AlterTable
ALTER TABLE "module" ALTER COLUMN "module_description" DROP NOT NULL;
