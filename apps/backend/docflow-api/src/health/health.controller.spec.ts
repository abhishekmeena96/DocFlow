import { HealthController } from './health.controller';

describe('HealthController', () => {
  let healthController: HealthController;

  beforeEach(() => {
    healthController = new HealthController();
  });

  it('should return status ok and a valid ISO timestamp', () => {
    const result = healthController.check();

    expect(result.status).toBe('ok');
    expect(new Date(result.timestamp).toISOString()).toBe(result.timestamp);
  });
});
