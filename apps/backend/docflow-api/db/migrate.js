'use strict';
require('./load-env');
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const { Client } = require('pg');

const MIGRATIONS_DIR = path.join(__dirname, 'migrations');
const LOCK_ID = 727001; // fixed number: stops two runners working at once

async function main() {
  if (!process.env.DATABASE_URL) {
    throw new Error('DATABASE_URL is not set');
  }
  const client = new Client({ connectionString: process.env.DATABASE_URL });
  await client.connect();
  try {
    await client.query('SELECT pg_advisory_lock($1)', [LOCK_ID]);
    await client.query(`
      CREATE TABLE IF NOT EXISTS schema_migrations (
        filename   text PRIMARY KEY,
        checksum   text NOT NULL,
        applied_at timestamptz NOT NULL DEFAULT now()
      )`);

    const { rows } = await client.query(
      'SELECT filename, checksum FROM schema_migrations',
    );
    const applied = new Map(rows.map((r) => [r.filename, r.checksum]));

    const files = fs
      .readdirSync(MIGRATIONS_DIR)
      .filter((f) => /^\d+_.+\.sql$/.test(f))
      .sort();

    let count = 0;
    for (const file of files) {
      const sql = fs.readFileSync(path.join(MIGRATIONS_DIR, file), 'utf8');
      const checksum = crypto.createHash('sha256').update(sql).digest('hex');

      if (applied.has(file)) {
        if (applied.get(file) !== checksum) {
          throw new Error(
            `${file} was changed after it was applied. Never edit an applied migration; add a new one.`,
          );
        }
        console.log(`skip   ${file}`);
        continue;
      }

      try {
        await client.query('BEGIN');
        await client.query(sql);
        await client.query(
          'INSERT INTO schema_migrations (filename, checksum) VALUES ($1, $2)',
          [file, checksum],
        );
        await client.query('COMMIT');
        console.log(`apply  ${file}`);
        count++;
      } catch (err) {
        await client.query('ROLLBACK');
        throw new Error(`${file} failed and was rolled back: ${err.message}`);
      }
    }
    console.log(
      count === 0 ? 'Database is up to date.' : `Applied ${count} migration(s).`,
    );
  } finally {
    await client.end();
  }
}

main().catch((err) => {
  console.error(err.message);
  process.exit(1);
});
