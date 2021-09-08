import { inject, injectable } from 'tsyringe'

import { Drug } from '@modules/drugs/infra/typeorm/entities/Drug'
import { IDrugsRepository } from '@modules/drugs/repositories/IDrugsRepository'
import { AppError } from '@shared/errors/AppError'

interface IRequest {
  name: string
  active_principle: string
  shape: string
  concentration: string
  inclusion_date: Date
}

@injectable()
class CreateDrugUseCase {
  constructor(
    @inject('DrugsRepository')
    private drugsRepository: IDrugsRepository
  ) {}

  async execute({
    name,
    active_principle,
    shape,
    concentration,
    inclusion_date,
  }: IRequest): Promise<Drug> {
    const drugAlreadyExists =
      await this.drugsRepository.findByNameAndConcentration(name, concentration)

    if (drugAlreadyExists) {
      throw new AppError('Drug already exists')
    }

    const drug = await this.drugsRepository.create({
      name,
      active_principle,
      shape,
      concentration,
      inclusion_date,
    })

    return drug
  }
}

export { CreateDrugUseCase }
