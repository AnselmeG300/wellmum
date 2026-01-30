import 'reflect-metadata';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix('api');

  const config = new DocumentBuilder()
    .setTitle('Whelmom API Clone')
    .setDescription('Minimal clone exposing healthcheck')
    .setVersion('0.1.0')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api/docs', app, document);

  await app.listen(3000);
  // eslint-disable-next-line no-console
  console.log('Listening on http://0.0.0.0:3000 (API root: /api, Swagger: /api/docs)');
}

bootstrap();
