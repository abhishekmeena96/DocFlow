'use strict';
require('./load-env');
const bcrypt = require('bcryptjs');
const { Client } = require('pg');

async function main() {
  const { DATABASE_URL, ADMIN_EMAIL, ADMIN_PASSWORD } = process.env;
  const name = process.env.ADMIN_NAME || 'Administrator';

  if (!DATABASE_URL) throw new Error('DATABASE_URL is not set');
  if (!ADMIN_EMAIL) throw new Error('ADMIN_EMAIL is not set');
  if (!ADMIN_PASSWORD || ADMIN_PASSWORD.length < 12) {
    throw new Error('ADMIN_PASSWORD must be set and at least 12 characters');
  }

  const hash = await bcrypt.hash(ADMIN_PASSWORD, 12);
  const client = new Client({ connectionString: DATABASE_URL });
  await client.connect();
  try {
    const result = await client.query(
      `INSERT INTO users (name, email, password_hash, role)
       VALUES ($1, $2, $3, 'admin')
       ON CONFLICT DO NOTHING`,
      [name, ADMIN_EMAIL, hash],
    );
    console.log(
      result.rowCount === 1
        ? `Admin created: ${ADMIN_EMAIL}`
        : `Admin already exists (not changed): ${ADMIN_EMAIL}`,
    );
  } finally {
    await client.end();
  }
}

main().catch((err) => {
  console.error(err.message);
  process.exit(1);
});
