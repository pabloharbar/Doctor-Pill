import { getRepository, Repository } from 'typeorm'

import { ICreateDrugDTO } from '@modules/drugs/dtos/ICreateDrugDTO'
import { IDrugsRepository } from '@modules/drugs/repositories/IDrugsRepository'

import { Drug } from '../entities/Drug'

class DrugsRepository implements IDrugsRepository {
  private repository: Repository<Drug>

  constructor() {
    this.repository = getRepository(Drug)
  }

  async create({
    id,
    name,
    active_principle,
    shape,
    concentration,
    inclusion_date,
    reference_drug_id,
  }: ICreateDrugDTO): Promise<Drug> {
    const drug = this.repository.create({
      id,
      name,
      active_principle,
      shape,
      concentration,
      inclusion_date,
      reference_drug_id,
    })

    await this.repository.save(drug)

    return drug
  }

  async findByNameAndConcentration(
    name: string,
    concentration: string
  ): Promise<Drug> {
    const drug = await this.repository.findOne({
      name,
      concentration,
    })

    return drug
  }

  async findById(id: string): Promise<Drug> {
    const drug = await this.repository.findOne(id)

    return drug
  }
}

export { DrugsRepository }
