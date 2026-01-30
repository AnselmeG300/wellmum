import { Injectable } from '@nestjs/common';

@Injectable()
export class HealthcheckService {
  getHealth() {
    return {
      status: 'ok',
      timestamp: new Date().toISOString(),
      uptime: process.uptime(),
      environment: process.env.NODE_ENV || 'development',
      version: '0.1.0',
    };
  }
}
