import { Router } from 'express'

import { ImportDrugsContoller } from '@modules/drugs/useCases/importDrugs/ImportDrugsController'
import { ListReferenceDrugsController } from '@modules/drugs/useCases/listReferenceDrugs/ListReferenceDrugsController'

const drugsRoutes = Router()

const importDrugsController = new ImportDrugsContoller()
const listReferenceDrugsController = new ListReferenceDrugsController()

drugsRoutes.get('/', listReferenceDrugsController.handle)
drugsRoutes.get('/load-csv', importDrugsController.handle)

export { drugsRoutes }
