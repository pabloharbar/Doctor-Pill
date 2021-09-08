import {
  Column,
  CreateDateColumn,
  Entity,
  JoinTable,
  ManyToMany,
  PrimaryColumn,
} from 'typeorm'
import { v4 as uuidV4 } from 'uuid'

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

  @ManyToMany(() => Drug)
  @JoinTable({
    name: 'similar_drugs',
    joinColumns: [{ name: 'reference_drug_id' }],
    inverseJoinColumns: [{ name: 'similar_drug_id' }],
  })
  similarDrugs: Drug[]

  @CreateDateColumn()
  created_at: Date

  constructor() {
    if (!this.id) {
      this.id = uuidV4()
    }
  }
}
