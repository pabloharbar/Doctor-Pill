import csvParse from 'csv-parse'
import fs from 'fs'
import { inject, injectable } from 'tsyringe'

import { Drug } from '@modules/drugs/infra/typeorm/entities/Drug'
import { ReferenceDrug } from '@modules/drugs/infra/typeorm/entities/ReferenceDrug'
import { IDrugsRepository } from '@modules/drugs/repositories/IDrugsRepository'
import { IReferenceDrugsRepository } from '@modules/drugs/repositories/IReferenceDrugsRepository'
import { dateConverter } from '@utils/dateConverter'

interface IImportDrug {
  name: string
  active_principle: string
  shape: string
  concentration: string
  inclusion_date: string
}

interface IImportReferenceDrug {
  name: string
  active_principle: string
  similar_drugs: IImportDrug[]
}

@injectable()
class ImportDrugsUseCase {
  constructor(
    @inject('DrugsRepository')
    private drugsRepository: IDrugsRepository,
    @inject('ReferenceDrugsRepository')
    private referenceDrugsRepository: IReferenceDrugsRepository
  ) {}

  loadDrugs(filePath: string): Promise<IImportReferenceDrug[]> {
    return new Promise((resolve, reject) => {
      const stream = fs.createReadStream(filePath)
      const referenceDrugs: IImportReferenceDrug[] = []

      const parseFile = csvParse({
        delimiter: ';',
        fromLine: 2, // First line contains header
      })

      stream.pipe(parseFile)
      let lastReferenceDrug = ''

      parseFile
        .on('data', async (line) => {
          const [
            name,
            active_principle,
            similar_drug,
            ,
            shape,
            concentration,
            inclusion_date,
          ] = line

          if (lastReferenceDrug !== name.toLocaleLowerCase()) {
            referenceDrugs.push({
              name,
              active_principle,
              similar_drugs: [
                {
                  name: similar_drug,
                  active_principle,
                  shape,
                  concentration,
                  inclusion_date,
                },
              ],
            })
          } else {
            referenceDrugs.at(-1).similar_drugs.push({
              name: similar_drug,
              active_principle,
              shape,
              concentration,
              inclusion_date,
            })
          }

          lastReferenceDrug = name.toLocaleLowerCase()
        })
        .on('end', () => {
          resolve(referenceDrugs)
        })
        .on('error', (error) => {
          reject(error)
        })
    })
  }

  async createReferenceDrug(
    referenceDrug: IImportReferenceDrug
  ): Promise<ReferenceDrug> {
    const { name, active_principle } = referenceDrug
    const referenceDrugExists = await this.referenceDrugsRepository.findByName(
      name
    )

    if (referenceDrugExists) {
      return referenceDrugExists
    }

    const newReferenceDrug = await this.referenceDrugsRepository.create({
      name,
      active_principle,
    })

    return newReferenceDrug
  }

  async createSimilarDrug(
    drug: IImportDrug,
    reference_drug_id: string
  ): Promise<Drug> {
    const { name, active_principle, concentration, inclusion_date, shape } =
      drug

    const drugExists = await this.drugsRepository.findByNameAndConcentration(
      name,
      concentration
    )

    if (drugExists) {
      return drugExists
    }

    const newDrug = await this.drugsRepository.create({
      name,
      active_principle,
      concentration,
      inclusion_date: dateConverter(inclusion_date),
      shape,
      reference_drug_id,
    })

    return newDrug
  }

  async execute(filePath: string): Promise<void> {
    const referenceDrugs = await this.loadDrugs(filePath)

    referenceDrugs.map(async (referenceDrug) => {
      const { similar_drugs } = referenceDrug

      const { id: reference_drug_id } = await this.createReferenceDrug(
        referenceDrug
      )

      similar_drugs.map(async (drug) => {
        await this.createSimilarDrug(drug, reference_drug_id)
      })
    })
  }
}

export { ImportDrugsUseCase }
