import express from "express"

// import { prisma } from "../../index.js";

import { genTokens } from "../../controller/tokens.js"

export const jwtRouter = express.Router()

// Generate access token and refresh token API.
// jwtRouter.get('/tokens', (req, res) => {
//   console.log("namnh2 test generate token API")

//   // const is_account_id_existed = prisma.account.findUnique({
//   //   where: {
//   //     account_id: 1,
//   //   },
//   // }).then((res) => {
//   //   console.log(res)
//   // })

//   // console.log('namnh2 test value of is_account_id_existed: ', is_account_id_existed)

//   res.status(200).json({message : "namnh2 test generate token API"})
// })

jwtRouter.get('/tokens', genTokens)