import { Request, Response } from 'express'
import { container } from 'tsyringe'

import { CreateReferenceDrugUseCase } from './CreateReferenceDrugUseCase'

class CreateReferenceDrugController {
  async handle(req: Request, res: Response): Promise<Response> {
    const { name, active_principle } = req.body

    const createReferenceDrugUseCase = container.resolve(
      CreateReferenceDrugUseCase
    )

    const drug = await createReferenceDrugUseCase.execute({
      name,
      active_principle,
    })

    return res.status(201).json(drug)
  }
}

export { CreateReferenceDrugController }
