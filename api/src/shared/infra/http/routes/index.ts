import { Router } from 'express'

import { drugsRoutes } from './drugs.routes'

const router = Router()

router.use('/similar', drugsRoutes)

export { router }
