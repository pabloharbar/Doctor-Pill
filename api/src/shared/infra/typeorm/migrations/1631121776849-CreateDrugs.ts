import { MigrationInterface, QueryRunner, Table } from 'typeorm'

export class CreateDrugs1631121776849 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'drugs',
        columns: [
          {
            name: 'id',
            type: 'uuid',
            isPrimary: true,
          },
          {
            name: 'name',
            type: 'varchar',
          },
          {
            name: 'active_principle',
            type: 'varchar',
          },
          {
            name: 'shape',
            type: 'varchar',
          },
          {
            name: 'concentration',
            type: 'varchar',
          },
          {
            name: 'inclusion_date',
            type: 'date',
          },
          {
            name: 'created_at',
            type: 'timestamp',
            default: 'now()',
          },
        ],
      })
    )
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('drugs')
  }
}
