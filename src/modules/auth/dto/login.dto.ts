import { ApiProperty } from '@nestjs/swagger';
import { IsString, Matches, MinLength } from 'class-validator';

export class LoginDto {
	@ApiProperty({ example: 'admin', description: 'Unique username' })
	@IsString()
	username: string;

	@ApiProperty({
		example: '12345Aa@',
		description: '...Strong password please...',
	})
	@IsString()
	@MinLength(6)
	@Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
		message: 'password too weak',
	})
	password: string;
}
