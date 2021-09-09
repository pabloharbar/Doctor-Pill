import { Request, Response, Router } from 'express'

import { CreateDrugController } from '@modules/drugs/useCases/createDrug/CreateDrugController'
import { ImportDrugsContoller } from '@modules/drugs/useCases/importDrugs/ImportDrugsController'
import { ListReferenceDrugsController } from '@modules/drugs/useCases/listReferenceDrugs/ListReferenceDrugsController'

const drugsRoutes = Router()

const importDrugsController = new ImportDrugsContoller()
const listReferenceDrugsController = new ListReferenceDrugsController()

drugsRoutes.get('/', listReferenceDrugsController.handle)
drugsRoutes.get('/load-csv', importDrugsController.handle)

export { drugsRoutes }
