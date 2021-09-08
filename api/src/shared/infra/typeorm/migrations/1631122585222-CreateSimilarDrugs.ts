import { MigrationInterface, QueryRunner, Table } from 'typeorm'

export class CreateSimilarDrugs1631122585222 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'similar_drugs',
        columns: [
          {
            name: 'reference_drug_id',
            type: 'uuid',
          },
          {
            name: 'similar_drug_id',
            type: 'uuid',
          },
          {
            name: 'created_at',
            type: 'timestamp',
            default: 'now()',
          },
        ],
        foreignKeys: [
          {
            name: 'FK_REFERENCE_DRUG',
            referencedTableName: 'drugs',
            referencedColumnNames: ['id'],
            columnNames: ['reference_drug_id'],
            onDelete: 'SET NULL',
            onUpdate: 'SET NULL',
          },
          {
            name: 'FK_SIMILAR_DRUG',
            referencedTableName: 'drugs',
            referencedColumnNames: ['id'],
            columnNames: ['similar_drug_id'],
            onDelete: 'SET NULL',
            onUpdate: 'SET NULL',
          },
        ],
      })
    )
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('similar_drugs')
  }
}
