-- CreateTable
CREATE TABLE "refresh_token" (
    "id" BIGSERIAL NOT NULL,
    "global_account_id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "refresh_token_value" TEXT NOT NULL,
    "public_key" TEXT NOT NULL,
    "private_key" TEXT NOT NULL,
    "algorithm" VARCHAR(10) NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "kong_credential_key" TEXT NOT NULL,
    "issued_at" TIMESTAMPTZ(3) NOT NULL,
    "not_available_before" TIMESTAMPTZ(3) NOT NULL,
    "expire_time" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "refresh_token_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "access_token" (
    "id" BIGSERIAL NOT NULL,
    "global_account_id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "refresh_token_id" BIGINT NOT NULL,
    "access_token_value" TEXT NOT NULL,
    "public_key" TEXT NOT NULL,
    "private_key" TEXT NOT NULL,
    "algorithm" VARCHAR(10) NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "scope" VARCHAR(20) NOT NULL,
    "kong_credential_key" TEXT NOT NULL,
    "issued_at" TIMESTAMPTZ(3) NOT NULL,
    "not_available_before" TIMESTAMPTZ(3) NOT NULL,
    "expire_time" TIMESTAMPTZ(3) NOT NULL,

    CONSTRAINT "access_token_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "refresh_token_global_account_id_key" ON "refresh_token"("global_account_id");

-- CreateIndex
CREATE UNIQUE INDEX "access_token_global_account_id_key" ON "access_token"("global_account_id");

-- AddForeignKey
ALTER TABLE "refresh_token" ADD CONSTRAINT "refresh_token_global_account_id_fkey" FOREIGN KEY ("global_account_id") REFERENCES "account"("global_account_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "access_token" ADD CONSTRAINT "access_token_global_account_id_fkey" FOREIGN KEY ("global_account_id") REFERENCES "account"("global_account_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "access_token" ADD CONSTRAINT "access_token_refresh_token_id_fkey" FOREIGN KEY ("refresh_token_id") REFERENCES "refresh_token"("id") ON DELETE CASCADE ON UPDATE CASCADE;
