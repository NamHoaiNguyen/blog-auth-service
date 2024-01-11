-- AlterTable
CREATE SEQUENCE access_token_access_token_id_seq;
ALTER TABLE "access_token" ALTER COLUMN "access_token_id" SET DEFAULT nextval('access_token_access_token_id_seq');
ALTER SEQUENCE access_token_access_token_id_seq OWNED BY "access_token"."access_token_id";

-- AlterTable
CREATE SEQUENCE refresh_token_refresh_token_id_seq;
ALTER TABLE "refresh_token" ALTER COLUMN "refresh_token_id" SET DEFAULT nextval('refresh_token_refresh_token_id_seq');
ALTER SEQUENCE refresh_token_refresh_token_id_seq OWNED BY "refresh_token"."refresh_token_id";
