import { Request, Response, Router } from 'express'

import { CreateDrugController } from '@modules/drugs/useCases/createDrug/CreateDrugController'
import { ImportDrugsContoller } from '@modules/drugs/useCases/importDrugs/ImportDrugsController'

const drugsRoutes = Router()

const createDrugController = new CreateDrugController()
const importDrugsController = new ImportDrugsContoller()

drugsRoutes.get('/', (req: Request, res: Response): Response => {
  return res.send("It's up!")
})

drugsRoutes.post('/', createDrugController.handle)
drugsRoutes.get('/load-csv', importDrugsController.handle)

export { drugsRoutes }
