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
    reference_drug_id,
  }: ICreateDrugDTO): Promise<Drug> {
    const drug = new Drug()

    Object.assign(drug, {
      id,
      name,
      active_principle,
      shape,
      concentration,
      inclusion_date,
      reference_drug_id,
    })

    this.drugs.push(drug)

    return drug
  }

  async findByNameAndConcentration(
    name: string,
    concentration: string
  ): Promise<Drug> {
    const drug = this.drugs.find(
      (drug) => drug.name === name && drug.concentration === concentration
    )

    return drug
  }

  async findById(id: string): Promise<Drug> {
    return this.drugs.find((drug) => drug.id === id)
  }
}

export { DrugsRepositoryInMemory }
