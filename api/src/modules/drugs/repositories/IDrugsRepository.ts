import { ICreateDrugDTO } from '../dtos/ICreateDrugDTO'
import { Drug } from '../infra/typeorm/entities/Drug'

interface IDrugsRepository {
  create(data: ICreateDrugDTO): Promise<Drug>
  findByNameAndConcentration(name: string, concentration: string): Promise<Drug>
  findById(id: string): Promise<Drug>
}

export { IDrugsRepository }
