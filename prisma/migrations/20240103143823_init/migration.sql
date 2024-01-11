-- CreateTable
CREATE TABLE "account" (
    "account_id" SERIAL NOT NULL,
    "global_account_id" UUID NOT NULL DEFAULT gen_random_uuid(),

    CONSTRAINT "account_pkey" PRIMARY KEY ("account_id")
);

-- CreateTable
CREATE TABLE "role" (
    "role_id" SMALLSERIAL NOT NULL,
    "role_name" VARCHAR(20) NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "account_role" (
    "global_account_id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "role_id" SMALLINT NOT NULL,

    CONSTRAINT "account_role_pkey" PRIMARY KEY ("global_account_id","role_id")
);

-- CreateTable
CREATE TABLE "module" (
    "module_id" SMALLSERIAL NOT NULL,
    "module_name" VARCHAR(30) NOT NULL,
    "module_description" VARCHAR(200) NOT NULL,

    CONSTRAINT "module_pkey" PRIMARY KEY ("module_id")
);

-- CreateTable
CREATE TABLE "module_role" (
    "module_id" SMALLINT NOT NULL,
    "role_id" SMALLINT NOT NULL,

    CONSTRAINT "module_role_pkey" PRIMARY KEY ("module_id","role_id")
);

-- CreateTable
CREATE TABLE "general_scope" (
    "general_scope_id" SMALLSERIAL NOT NULL,
    "module_id" SMALLINT NOT NULL,
    "role_id" SMALLINT NOT NULL,
    "scope" VARCHAR(30) NOT NULL,
    "scope_description" VARCHAR(200) NOT NULL,

    CONSTRAINT "general_scope_pkey" PRIMARY KEY ("general_scope_id")
);

-- CreateTable
CREATE TABLE "inner_scope" (
    "inner_scope_id" SMALLSERIAL NOT NULL,
    "role_id" SMALLINT NOT NULL,
    "scope" VARCHAR(30) NOT NULL,
    "scope_description" VARCHAR(200) NOT NULL,

    CONSTRAINT "inner_scope_pkey" PRIMARY KEY ("inner_scope_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "account_global_account_id_key" ON "account"("global_account_id");

-- CreateIndex
CREATE UNIQUE INDEX "role_role_name_key" ON "role"("role_name");

-- CreateIndex
CREATE UNIQUE INDEX "account_role_global_account_id_key" ON "account_role"("global_account_id");

-- CreateIndex
CREATE UNIQUE INDEX "module_module_name_key" ON "module"("module_name");

-- CreateIndex
CREATE UNIQUE INDEX "general_scope_scope_key" ON "general_scope"("scope");

-- CreateIndex
CREATE UNIQUE INDEX "inner_scope_scope_key" ON "inner_scope"("scope");

-- AddForeignKey
ALTER TABLE "account_role" ADD CONSTRAINT "account_role_global_account_id_fkey" FOREIGN KEY ("global_account_id") REFERENCES "account"("global_account_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "account_role" ADD CONSTRAINT "account_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "module_role" ADD CONSTRAINT "module_role_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "module"("module_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "module_role" ADD CONSTRAINT "module_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "general_scope" ADD CONSTRAINT "general_scope_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "module"("module_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "general_scope" ADD CONSTRAINT "general_scope_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inner_scope" ADD CONSTRAINT "inner_scope_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE CASCADE ON UPDATE CASCADE;
