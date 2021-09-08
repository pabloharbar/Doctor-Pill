import { Column, CreateDateColumn, Entity, PrimaryColumn } from 'typeorm'
import { v4 as uuidV4 } from 'uuid'

@Entity('reference_drugs')
class ReferenceDrug {
  @PrimaryColumn()
  id: string

  @Column()
  name: string

  @Column()
  active_principle: string

  @CreateDateColumn()
  created_at: Date

  constructor() {
    if (!this.id) {
      this.id = uuidV4()
    }
  }
}

export { ReferenceDrug }
