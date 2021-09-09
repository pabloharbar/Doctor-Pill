import { ICreateReferenceDrugDTO } from '../dtos/ICreateReferenceDrugDTO'
import { ReferenceDrug } from '../infra/typeorm/entities/ReferenceDrug'

interface IReferenceDrugsRepository {
  create(data: ICreateReferenceDrugDTO): Promise<ReferenceDrug>
  findByName(name: string): Promise<ReferenceDrug>
  findById(id: string): Promise<ReferenceDrug>
  findByNameOrSimilarDrug(drugName: string): Promise<ReferenceDrug>
}

export { IReferenceDrugsRepository }
