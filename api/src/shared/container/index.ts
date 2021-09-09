import { container } from 'tsyringe'

import { DrugsRepository } from '@modules/drugs/infra/typeorm/repositories/DrugsRepository'
import { ReferenceDrugsRepository } from '@modules/drugs/infra/typeorm/repositories/ReferenceDrugsRepository'
import { IDrugsRepository } from '@modules/drugs/repositories/IDrugsRepository'
import { IReferenceDrugsRepository } from '@modules/drugs/repositories/IReferenceDrugsRepository'

container.registerSingleton<IDrugsRepository>(
  'DrugsRepository',
  DrugsRepository
)

container.registerSingleton<IReferenceDrugsRepository>(
  'ReferenceDrugsRepository',
  ReferenceDrugsRepository
)
