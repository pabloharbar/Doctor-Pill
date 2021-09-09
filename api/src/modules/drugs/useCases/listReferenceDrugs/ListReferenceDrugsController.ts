import { Request, Response } from 'express'
import { container } from 'tsyringe'

import { AppError } from '@shared/errors/AppError'

import { ListReferenceDrugsUseCase } from './ListReferenceDrugsUseCase'

class ListReferenceDrugsController {
  async handle(req: Request, res: Response): Promise<Response> {
    const { name } = req.query
    const listReferenceDrugsUseCase = container.resolve(
      ListReferenceDrugsUseCase
    )

    const drugExists = await listReferenceDrugsUseCase.execute(name as string)

    if (!drugExists) {
      throw new AppError("Drug doesn't exists")
    }

    const { name: drugName, active_principle, drugs } = drugExists

    const uniqueDrugs = Array.from(new Set(drugs.flatMap((drug) => drug.name)))

    return res.json({
      name: drugName,
      active_principle,
      similars: uniqueDrugs,
    })
  }
}

export { ListReferenceDrugsController }
