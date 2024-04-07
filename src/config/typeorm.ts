import { registerAs } from '@nestjs/config';
import { config as dotenvConfig } from 'dotenv';
import { DataSource, DataSourceOptions } from 'typeorm';

dotenvConfig({ path: '.env' });
const config = {
	type: 'mysql',
	host: `${process.env.TYPEORM_MYSQL_HOST}`,
	port: `${process.env.TYPEORM_MYSQL_PORT}`,
	username: `${process.env.TYPEORM_MYSQL_USERNAME}`,
	password: `${process.env.TYPEORM_MYSQL_PASSWORD}`,
	database: `${process.env.TYPEORM_MYSQL_DB}`,
	entities: ['dist/**/*.entity{.ts,.js}'],
	migrations: ['dist/src/database/migrations/*{.ts,.js}'],
	autoLoadEntities: false,
	synchronize: false,
};

export default registerAs('typeorm', () => config);
export const connectionSource = new DataSource(config as DataSourceOptions);
