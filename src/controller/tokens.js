import jwt from 'jsonwebtoken'
import fs from 'fs'

import { saveAccessTokenToDb } from "../models/access_token.js"
import { saveRefreshTokenToDb } from "../models/refresh_token.js"

const file_path = '/home/node/private.key'

async function genTokens(req, res) {
  // Get account_id from the request sent from account service.
  // TODO(namnh) : just for testing when doesn't have account service APIs.
  const account_id = "namnh"
  const role = "admin"

  // if (account_id === null || role == null) {
  //   return;
  // }

  fs.readFile(file_path, "utf8", (err, jwt_private_key) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Account Service Error!!!" });
    }

    const current_time = new Date();

    const access_token_iat = current_time.getTime();
    const access_token_nbf = access_token_iat;
    const access_token_exp =
      current_time.getTime() +
      60 * 60 * 1000 -
      (current_time.getTime() - current_time.getMilliseconds()) / 1000;

    const refresh_token_iat = access_token_iat;
    const refresh_token_nbf = access_token_iat;
    const refresh_token_exp =
      current_time.getTime() +
      7 * 24 * 60 * 60 * 1000 -
      (current_time.getTime() - current_time.getMilliseconds()) / 1000;

    const access_token = jwt.sign(
      {
        account_id: account_id,
        role: role,
        iat: access_token_iat,
        notBefore: access_token_nbf,
        expiresIn: access_token_exp,
      },
      jwt_private_key,
      {
        algorithm: "RS256",
        header: { kid: process.env.KONG_KID_KEY },
      }
    );

    const refresh_token = jwt.sign(
      {
        iat: refresh_token_iat,
        notBefore: refresh_token_nbf,
        expiresIn: refresh_token_exp,
      },
      jwt_private_key,
      { algorithm: "RS256" }
    );

    console.log("namnh2 check access token ", access_token);
    console.log("namnh2 check efresh token ", refresh_token);

    saveAccessTokenToDb(
      access_token,
      access_token_iat,
      access_token_nbf,
      access_token_exp,
      true
    );
    saveRefreshTokenToDb(
      refresh_token,
      refresh_token_iat,
      refresh_token_nbf,
      refresh_token_exp,
      true
    )

    res.cookie("access_token", access_token, {
      httpOnly: true,
      secure: true,
      sameSite: "lax",
    });

    res.cookie("refresh_token", refresh_token, {
      path: "/refresh",
      httpOnly: true,
      secure: true,
      sameSite: "lax",
    });

    return res.status(200).json({ message: "Sent token successfully!!!" });
  });
}

export {
  genTokens,
}