import { Request, Response, Router } from 'express'

const drugsRoutes = Router()

drugsRoutes.get('/', (req: Request, res: Response): Response => {
  return res.send("It's up!")
})

export { drugsRoutes }
