import {
  Body,
  Controller,
  INestApplication,
  Post,
  ValidationPipe,
} from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import { IsEmail, IsNotEmpty, IsString } from 'class-validator';
import request from 'supertest';
import { App } from 'supertest/types';

import { AppModule } from './../src/app.module';
import { HttpExceptionFilter } from './../src/common/filters/http-exception.filter';

class ValidationTestDto {
  @IsString()
  @IsNotEmpty()
  name!: string;

  @IsEmail()
  email!: string;
}

@Controller('test-validation')
class ValidationTestController {
  @Post()
  validate(@Body() body: ValidationTestDto) {
    return {
      message: 'Validation successful',
      data: body,
    };
  }
}

describe('DocFlow API (e2e)', () => {
  let app: INestApplication<App>;

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
      controllers: [ValidationTestController],
    }).compile();

    app = moduleFixture.createNestApplication();

    app.setGlobalPrefix('api');

    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
        forbidNonWhitelisted: true,
        transform: true,
      }),
    );

    app.useGlobalFilters(new HttpExceptionFilter());

    await app.init();
  });

  afterEach(async () => {
    await app.close();
  });

  it('GET /api/health should return HTTP 200', async () => {
    const response = await request(app.getHttpServer())
      .get('/api/health')
      .expect(200);

    expect(response.body.status).toBe('ok');
    expect(new Date(response.body.timestamp).toISOString()).toBe(
      response.body.timestamp,
    );
  });

  it('unknown routes should return the standard 404 error format', async () => {
    const response = await request(app.getHttpServer())
      .get('/api/not-found')
      .expect(404);

    expect(response.body).toEqual(
      expect.objectContaining({
        statusCode: 404,
        message: 'Cannot GET /api/not-found',
        path: '/api/not-found',
      }),
    );

    expect(new Date(response.body.timestamp).toISOString()).toBe(
      response.body.timestamp,
    );
  });

  it('invalid request body should return HTTP 400', async () => {
    const response = await request(app.getHttpServer())
      .post('/api/test-validation')
      .send({
        name: 123,
        email: 'invalid-email',
      })
      .expect(400);

    expect(response.body.statusCode).toBe(400);
    expect(response.body.path).toBe('/api/test-validation');
    expect(Array.isArray(response.body.message)).toBe(true);
  });

  it('extra request properties should be rejected', async () => {
    const response = await request(app.getHttpServer())
      .post('/api/test-validation')
      .send({
        name: 'Abhishek',
        email: 'abhishek@example.com',
        role: 'admin',
      })
      .expect(400);

    expect(response.body.statusCode).toBe(400);
    expect(response.body.path).toBe('/api/test-validation');
    expect(response.body.message).toContain(
      'property role should not exist',
    );
  });
});
