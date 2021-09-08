import csvParse from 'csv-parse'
import fs from 'fs'
import { inject, injectable } from 'tsyringe'

import { IDrugsRepository } from '@modules/drugs/repositories/IDrugsRepository'

interface IImportDrug {
  name: string
  active_principle: string
  similar_drug: string
  // similar_record_holder: string
  shape: string
  concentration: string
  inclusion_date: Date
}

@injectable()
class ImportDrugsUseCase {
  constructor(
    @inject('DrugsRepository')
    private drugsRepository: IDrugsRepository
  ) {}

  loadDrugs(filePath: string): Promise<IImportDrug[]> {
    return new Promise((resolve, reject) => {
      const stream = fs.createReadStream(filePath)
      const drugs: IImportDrug[] = []

      const parseFile = csvParse({
        delimiter: ';',
        fromLine: 2, // First line contains header
      })

      stream.pipe(parseFile)

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
          drugs.push({
            name,
            active_principle,
            similar_drug,
            shape,
            concentration,
            inclusion_date,
          })
        })
        .on('end', () => {
          resolve(drugs)
        })
        .on('error', (error) => {
          reject(error)
        })
    })
  }

  async execute(filePath: string): Promise<void> {
    const drugs = await this.loadDrugs(filePath)

    const similarDrugs = drugs.map((drug) => {
      const {
        similar_drug: name,
        active_principle,
        name: referenceDrugName,
        shape,
        concentration,
        inclusion_date,
      } = drug

      return {
        name,
        active_principle,
        referenceDrugName,
        shape,
        concentration,
        inclusion_date,
      }
    })

    console.table(drugs)
    console.table(similarDrugs)
    // drugs.map(async)
  }
}

export { ImportDrugsUseCase }
