import { ArgumentsHost } from '@nestjs/common';
import { HttpExceptionFilter } from './http-exception.filter';

describe('HttpExceptionFilter', () => {
  let filter: HttpExceptionFilter;

  beforeEach(() => {
    filter = new HttpExceptionFilter();
  });

  it('should return the standard HTTP 500 response for unexpected errors', () => {
    const response = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };

    const request = {
      originalUrl: '/api/test-error',
      url: '/api/test-error',
    };

    const host = {
      switchToHttp: () => ({
        getResponse: () => response,
        getRequest: () => request,
      }),
    } as unknown as ArgumentsHost;

    filter.catch(new Error('Unexpected test error'), host);

    expect(response.status).toHaveBeenCalledWith(500);

    expect(response.json).toHaveBeenCalledWith(
      expect.objectContaining({
        statusCode: 500,
        message: 'Internal server error',
        path: '/api/test-error',
      }),
    );

    const body = response.json.mock.calls[0][0];

    expect(new Date(body.timestamp).toISOString()).toBe(body.timestamp);
  });
});
