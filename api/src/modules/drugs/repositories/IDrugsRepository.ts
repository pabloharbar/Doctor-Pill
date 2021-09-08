import { ICreateDrugDTO } from '../dtos/ICreateDrugDTO'
import { Drug } from '../infra/typeorm/entities/Drug'

interface IDrugsRepository {
  create(data: ICreateDrugDTO): Promise<Drug>
  findByName(name: string): Promise<Drug[]>
  findById(id: string): Promise<Drug>
}

export { IDrugsRepository }
