import { Logger, Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { Role } from '../roles/entities/role.entity';
import { UserSubscriber } from './users.subscriber';

@Module({
	imports: [TypeOrmModule.forFeature([User, Role])],
	controllers: [UsersController],
	providers: [UsersService, UserSubscriber, Logger],
	exports: [UsersService],
})
export class UsersModule {}
