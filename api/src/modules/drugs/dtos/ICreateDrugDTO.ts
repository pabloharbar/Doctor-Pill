import { Drug } from '@modules/drugs/infra/typeorm/entities/Drug'

interface ICreateDrugDTO {
  id?: string
  name: string
  active_principle: string
  shape: string
  concentration: string
  inclusion_date: Date
  similarDrugs?: Drug[]
}

export { ICreateDrugDTO }
