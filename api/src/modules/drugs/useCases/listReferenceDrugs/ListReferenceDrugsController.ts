import { Request, Response } from 'express'
import { container } from 'tsyringe'

import { ListReferenceDrugsUseCase } from './ListReferenceDrugsUseCase'

class ListReferenceDrugsController {
  async handle(req: Request, res: Response): Promise<Response> {
    const { name } = req.query
    const listReferenceDrugsUseCase = container.resolve(
      ListReferenceDrugsUseCase
    )

    const {
      name: drugName,
      active_principle,
      drugs,
    } = await listReferenceDrugsUseCase.execute(name as string)

    const uniqueDrugs = Array.from(new Set(drugs.flatMap((drug) => drug.name)))

    return res.json({
      name: drugName,
      active_principle,
      similars: uniqueDrugs,
    })
  }
}

export { ListReferenceDrugsController }
