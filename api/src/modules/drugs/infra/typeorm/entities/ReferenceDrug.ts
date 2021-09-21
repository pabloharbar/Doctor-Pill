import {
  Column,
  CreateDateColumn,
  Entity,
  OneToMany,
  PrimaryColumn,
} from 'typeorm'
import { v4 as uuidV4 } from 'uuid'

import { Drug } from './Drug'

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

  @OneToMany(() => Drug, (drug) => drug.referenceDrug)
  drugs: Drug[]

  constructor() {
    if (!this.id) {
      this.id = uuidV4()
    }
  }
}

export { ReferenceDrug }
