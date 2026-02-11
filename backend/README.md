npm i -g @nestjs/cli
nest new backend
cd backend

npm install @nestjs/config @nestjs/jwt @nestjs/passport passport passport-jwt bcrypt
npm install -D @types/passport-jwt @types/bcrypt
npm install @nestjs/typeorm typeorm mysql2

nest g module <...>
nest g service <...>
nest g controller <...>
nest g class <...>/entities/<...>.entity --no-spec --flat

