import express, { NextFunction, Request, Response } from 'express'
import 'express-async-errors'
import 'reflect-metadata'

import { AppError } from '@shared/errors/AppError'
import { router } from '@shared/infra/http/routes'
import createConnection from '@shared/infra/typeorm'

import '@shared/container'

createConnection()
const app = express()

app.use(express.json())

app.use(router)

app.use((error: Error, req: Request, res: Response, next: NextFunction) => {
  if (error instanceof AppError) {
    return res.status(error.statusCode).json({
      message: error.message,
    })
  }

  return res.status(500).json({
    status: 'error',
    message: `Internal server error - ${error.message}`,
  })
})

app.listen(3333, () => {
  console.log('💊 Dr. Pill similar drugs API is running!')
})
