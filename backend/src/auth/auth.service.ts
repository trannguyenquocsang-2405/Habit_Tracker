import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
    // Auth service implementation
    constructor(
        @InjectRepository(User) private userRepository: Repository<User>,
        private jwtService: JwtService,
    ) {}

    async register(email: string, password: string) {
        const existingUser = await this.userRepository.findOne({ where: { email } });
        if (existingUser) {
            throw new UnauthorizedException('Email đã được sử dụng');
        }

        const hashed = await bcrypt.hash(password, 10);
        const user = this.userRepository.create({ email, password: hashed });
        await this.userRepository.save(user);
        
        return { message: 'Đăng ký thành công' };
    }

    async login(email: string, password: string) {
        const user = await this.userRepository.findOne({ where: { email } });
        if (!user || !(await bcrypt.compare(password, user.password))) {
            throw new UnauthorizedException('Sai thông tin đăng nhập');
        }
        const token = this.jwtService.sign({ email: user.email, sub: user.id });
        return { token };
    }
}
