import { ApiProperty } from '@nestjs/swagger';
import { Exclude } from 'class-transformer';
import { IsString, Matches, MinLength } from 'class-validator';
import { Role } from 'src/modules/roles/entities/role.entity';
import { BaseEntity } from 'src/modules/shared/base/base.entity';
import { Entity, Column, ManyToOne, OneToMany } from 'typeorm';

@Entity()
export class User extends BaseEntity {
	@Column({ nullable: true })
	name?: string;

	@Column({ unique: true })
	username: string;

	@Column()
	@IsString()
	@MinLength(6)
	@Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
		message: 'password too weak',
	})
	@Exclude()
	password: string;

	@ApiProperty({ example: 1, description: '' })
	@Column({ nullable: true })
	age?: number;

	@ManyToOne(() => Role, (role) => role.users)
	role: Role;

	constructor(partial: Partial<User>) {
		super();
		Object.assign(this, partial);
	}
}
