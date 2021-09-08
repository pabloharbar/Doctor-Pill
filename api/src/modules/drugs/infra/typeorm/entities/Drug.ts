import {
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryColumn,
} from 'typeorm'
import { v4 as uuidV4 } from 'uuid'

import { ReferenceDrug } from './ReferenceDrug'

@Entity('drugs')
class Drug {
  @PrimaryColumn()
  id: string

  @Column()
  name: string

  @Column()
  active_principle: string

  @Column()
  shape: string

  @Column()
  concentration: string

  @Column()
  inclusion_date: Date

  @ManyToOne(() => ReferenceDrug)
  @JoinColumn({ name: 'reference_drug_id' })
  referenceDrug: ReferenceDrug

  @Column()
  reference_drug_id: string

  @CreateDateColumn()
  created_at: Date

  constructor() {
    if (!this.id) {
      this.id = uuidV4()
    }
  }
}

export { Drug }
