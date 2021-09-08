import { container } from 'tsyringe'

import { DrugsRepository } from '@modules/drugs/infra/typeorm/repositories/DrugsRepository'
import { IDrugsRepository } from '@modules/drugs/repositories/IDrugsRepository'

container.registerSingleton<IDrugsRepository>(
  'DrugsRepository',
  DrugsRepository
)
