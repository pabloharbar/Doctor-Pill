import { inject, injectable } from 'tsyringe'

import { ReferenceDrug } from '@modules/drugs/infra/typeorm/entities/ReferenceDrug'
import { IReferenceDrugsRepository } from '@modules/drugs/repositories/IReferenceDrugsRepository'

@injectable()
class ListReferenceDrugsUseCase {
  constructor(
    @inject('ReferenceDrugsRepository')
    private referenceDrugsRepository: IReferenceDrugsRepository
  ) {}

  async execute(name: string): Promise<ReferenceDrug> {
    const referenceDrug =
      await this.referenceDrugsRepository.findByNameOrSimilarDrug(name)

    return referenceDrug
  }
}

export { ListReferenceDrugsUseCase }
