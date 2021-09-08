import { ICreateDrugDTO } from '@modules/drugs/dtos/ICreateDrugDTO'
import { Drug } from '@modules/drugs/infra/typeorm/entities/Drug'

import { IDrugsRepository } from '../IDrugsRepository'

class DrugsRepositoryInMemory implements IDrugsRepository {
  drugs: Drug[] = []

  async create({
    id,
    name,
    active_principle,
    shape,
    concentration,
    inclusion_date,
    similarDrugs,
  }: ICreateDrugDTO): Promise<Drug> {
    const drug = new Drug()

    Object.assign(drug, {
      id,
      name,
      active_principle,
      shape,
      concentration,
      inclusion_date,
      similarDrugs,
    })

    this.drugs.push(drug)

    return drug
  }

  async findByName(name: string): Promise<Drug[]> {
    const drugs = this.drugs.filter((drug) => drug.name === name)

    return drugs
  }

  async findById(id: string): Promise<Drug> {
    return this.drugs.find((drug) => drug.id === id)
  }
}

export { DrugsRepositoryInMemory }
