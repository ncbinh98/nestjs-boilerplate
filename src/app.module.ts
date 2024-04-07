import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import configuration from './config/configuration';
import typeorm from './config/typeorm';
import { APP_FILTER, APP_GUARD } from '@nestjs/core';
import { CacheModule } from '@nestjs/cache-manager';
import { RedisOptions } from './config/redis.config';
import { UtilsModule } from './utils/utils.module';
import { ServeStaticModule } from '@nestjs/serve-static';
import { join } from 'path';
import { AuthModule } from './modules/auth/auth.module';
import { JwtAuthGuard } from './modules/auth/jwt-auth.guard';
import { CaslModule } from './modules/casl/casl.module';
import { PermissionsModule } from './modules/permissions/permissions.module';
import { RolesModule } from './modules/roles/roles.module';
import { UsersModule } from './modules/users/users.module';
import { GlobalExceptionFilter } from './exception-filters/global-exception.filter';
import { SearchModule } from './modules/search/search.module';
import * as Joi from 'joi';

@Module({
	imports: [
		ConfigModule.forRoot({
			validationSchema: Joi.object({
				NODE_ENV: Joi.string()
					.valid('develop', 'production', 'test', 'staging')
					.default('develop'),
				PORT: Joi.number().default(3000),
			}),
			load: [configuration, typeorm],
			cache: true,
			expandVariables: true,
		}),
		CacheModule.registerAsync(RedisOptions),

		/* 
      Setup datasource for migration process and init database instance
    */
		TypeOrmModule.forRootAsync({
			imports: [ConfigModule],
			inject: [ConfigService],
			useFactory: (configService: ConfigService) =>
				configService.get('typeorm'),
		}),

		ServeStaticModule.forRoot({
			rootPath: join(__dirname, './served'),
		}),

		UsersModule,
		AuthModule,
		RolesModule,
		PermissionsModule,
		CaslModule,
		UtilsModule,
		SearchModule,
	],
	controllers: [AppController],
	providers: [
		AppService,
		{
			provide: APP_GUARD,
			useClass: JwtAuthGuard,
		},
		{
			provide: APP_FILTER,
			useClass: GlobalExceptionFilter,
		},
	],
})
export class AppModule {}
