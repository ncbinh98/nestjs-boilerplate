import { MigrationInterface, QueryRunner } from 'typeorm';
import * as fs from 'fs';
import * as path from 'path';

export class SeedData1712465657324 implements MigrationInterface {
	readSqlFile = (filepath: string): string[] => {
		return fs
			.readFileSync(
				path.join(`${__dirname}/../../../../src/database/migrations`, filepath),
			)
			.toString()
			.replace(/\r?\n|\r/g, '\n')
			.split(';\n')
			.filter((query) => query?.length);
	};

	public async up(queryRunner: QueryRunner): Promise<void> {
		const queries = this.readSqlFile('init.sql');

		for (let i = 0; i < queries.length; i++) {
			await queryRunner.query(queries[i]);
		}
	}

	public async down(): Promise<void> {}
}
