import { Request, Response } from 'express'
import fs from 'fs'
import path from 'path'
import { container } from 'tsyringe'

// import anvisaCSV from '@utils/lista-de-medicamentos-similares-intercambiaveis-teste.csv'

import { ImportDrugsUseCase } from './ImportDrugsUseCase'

class ImportDrugsContoller {
  async handle(req: Request, res: Response): Promise<Response> {
    const importDrugsUseCase = container.resolve(ImportDrugsUseCase)

    const csvPath = path.resolve(
      __dirname,
      '../../../..',
      'utils/lista-de-medicamentos-similares-intercambiaveis-teste.csv'
    )

    await importDrugsUseCase.execute(csvPath)

    return res.status(201).send()
  }
}

export { ImportDrugsContoller }
