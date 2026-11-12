'use strict';
const fs = require('node:fs');
const path = require('node:path');

// Load the repo-root .env, unless DATABASE_URL is already set (e.g. in Docker).
const envFile = path.resolve(__dirname, '..', '..', '..', '..', '.env');
if (!process.env.DATABASE_URL && fs.existsSync(envFile)) {
  process.loadEnvFile(envFile);
}
