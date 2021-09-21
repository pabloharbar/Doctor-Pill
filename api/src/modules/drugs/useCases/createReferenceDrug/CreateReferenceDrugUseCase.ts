import { inject, injectable } from 'tsyringe'

import { ReferenceDrug } from '@modules/drugs/infra/typeorm/entities/ReferenceDrug'
import { IReferenceDrugsRepository } from '@modules/drugs/repositories/IReferenceDrugsRepository'
import { AppError } from '@shared/errors/AppError'

interface IRequest {
  name: string
  active_principle: string
}

@injectable()
class CreateReferenceDrugUseCase {
  constructor(
    @inject('ReferenceDrugsRepository')
    private referenceDrugsRepository: IReferenceDrugsRepository
  ) {}

  async execute({ name, active_principle }: IRequest): Promise<ReferenceDrug> {
    const referenceDrugAlreadyExists =
      await this.referenceDrugsRepository.findByName(name)

    if (referenceDrugAlreadyExists) {
      throw new AppError('Reference drug already exists')
    }

    const referenceDrug = await this.referenceDrugsRepository.create({
      name,
      active_principle,
    })

    return referenceDrug
  }
}

export { CreateReferenceDrugUseCase }
