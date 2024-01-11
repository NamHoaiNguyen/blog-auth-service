import express, { Router } from 'express'

import { jwtRouter } from './jwt_auth/jwt_tokens.js'

export const route = express.Router()

route.use('/', jwtRouter)