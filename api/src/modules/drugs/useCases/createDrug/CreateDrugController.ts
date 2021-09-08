import { Request, Response } from 'express'
import { container } from 'tsyringe'

import { CreateDrugUseCase } from './CreateDrugUseCase'

class CreateDrugController {
  async handle(req: Request, res: Response): Promise<Response> {
    const {
      name,
      active_principle,
      shape,
      concentration,
      inclusion_date,
      reference_drug_id,
    } = req.body

    const createDrugUseCase = container.resolve(CreateDrugUseCase)

    const drug = await createDrugUseCase.execute({
      name,
      active_principle,
      shape,
      concentration,
      inclusion_date,
      reference_drug_id,
    })

    return res.status(201).json(drug)
  }
}

export { CreateDrugController }
