import { ICreateReferenceDrugDTO } from '@modules/drugs/dtos/ICreateReferenceDrugDTO'
import { ReferenceDrug } from '@modules/drugs/infra/typeorm/entities/ReferenceDrug'

import { IReferenceDrugsRepository } from '../IReferenceDrugsRepository'

class ReferenceDrugsRepositoryInMemory implements IReferenceDrugsRepository {
  referenceDrugs: ReferenceDrug[] = []

  async create({
    id,
    name,
    active_principle,
  }: ICreateReferenceDrugDTO): Promise<ReferenceDrug> {
    const referenceDrug = new ReferenceDrug()

    Object.assign(referenceDrug, {
      id,
      name,
      active_principle,
    })

    this.referenceDrugs.push(referenceDrug)

    return referenceDrug
  }

  async findByName(name: string): Promise<ReferenceDrug> {
    return this.referenceDrugs.find((drug) => drug.name === name)
  }

  async findById(id: string): Promise<ReferenceDrug> {
    return this.referenceDrugs.find((drug) => drug.id === id)
  }

  async findByNameOrSimilarDrug(drugName: string): Promise<ReferenceDrug> {
    const referenceDrug = this.findByName(drugName)

    if (referenceDrug) {
      return referenceDrug
    }

    return this.referenceDrugs.find((referenceDrug) =>
      referenceDrug.drugs.find((drug) => drug.name === drugName)
    )
  }
}

export { ReferenceDrugsRepositoryInMemory }
