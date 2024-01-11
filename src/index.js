
import bodyParser from 'body-parser'
import cookieParser from 'cookie-parser'
import express from 'express'
import { PrismaClient } from '@prisma/client'

import { route } from './routes/routes.js'

const app = express()

app.use(bodyParser.urlencoded({
  extended: true
}))
app.use(bodyParser.json())
app.use(cookieParser())
// app.set('view engine', 'html')

export const prisma = new PrismaClient()

const LISTEN_PORT = 9956

// Index page
app.get("/", function(req, res) {
  res.end('Hello World');
});

// Route to pages.
app.use('/', route)

// const server = http.createServer({ key: SSL_KEY, cert: SSL_CERT }, app)
// server.listen(LISTEN_PORT, () => {
//   console.log("Server is listening on https://konghq.com:${port}")
// })

app.listen(LISTEN_PORT, () => {
  console.log("Server is listening on ${port}")
})

console.log("Running at Port " + LISTEN_PORT);