import { prisma } from "../index.js"


async function saveAccessTokenToDb(
  access_token,
  iat,
  nbf,
  exp,
  is_still_validated) {
  if (access_token === null) {
    return;
  }

  // Convert linux epoch time to DateTime database
  const save_iat = new Date(iat)
  const save_nbf = new Date(nbf)
  const save_exp = new Date(exp)

  const is_token_saved = await prisma.access_token.create({
    data: {
      access_token_value: access_token,
      issued_at: save_iat,
      not_available_before: save_nbf,
      expire_time: save_exp,
      is_still_validated : is_still_validated
    },
  });
}

export { saveAccessTokenToDb };