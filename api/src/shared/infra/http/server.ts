import express, { NextFunction, Request, Response } from 'express'

import { AppError } from '@shared/errors/AppError'
import createConnection from '@shared/infra/typeorm'

createConnection()
const app = express()

app.use(express.json())

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
