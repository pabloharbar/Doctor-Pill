import { getRepository, Repository } from 'typeorm'

import { ICreateReferenceDrugDTO } from '@modules/drugs/dtos/ICreateReferenceDrugDTO'
import { IReferenceDrugsRepository } from '@modules/drugs/repositories/IReferenceDrugsRepository'

import { ReferenceDrug } from '../entities/ReferenceDrug'

class ReferenceDrugsRepository implements IReferenceDrugsRepository {
  private repository: Repository<ReferenceDrug>

  constructor() {
    this.repository = getRepository(ReferenceDrug)
  }

  async create({
    id,
    name,
    active_principle,
  }: ICreateReferenceDrugDTO): Promise<ReferenceDrug> {
    const referenceDrug = this.repository.create({
      id,
      name,
      active_principle,
    })

    await this.repository.save(referenceDrug)

    return referenceDrug
  }

  async findByName(name: string): Promise<ReferenceDrug> {
    const referenceDrug = await this.repository.findOne({ name })

    return referenceDrug
  }

  async findById(id: string): Promise<ReferenceDrug> {
    const referenceDrug = await this.repository.findOne(id)

    return referenceDrug
  }
}

export { ReferenceDrugsRepository }
