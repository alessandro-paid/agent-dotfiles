---
name: paid-postgres
description: Query and, only when explicitly authorized, modify Paid's PostgreSQL database through POSTGRES_RO_URL and POSTGRES_RW_URL. Use when inspecting its schema, answering data questions, or performing requested database changes.
---

# Paid Postgres

Never print, log, or persist either connection URL. If a required variable is missing, stop and ask the user to make it available in the agent environment; never ask them to paste it into chat.

## Read-only access

Use `POSTGRES_RO_URL` by default for all schema inspection and queries. Do not read, validate, or use `POSTGRES_RW_URL` unless the user explicitly requests write access in the current conversation.

Connect with `psql` while keeping the URL out of command arguments:

```bash
PGDATABASE="$POSTGRES_RO_URL" \
PGOPTIONS="-c default_transaction_read_only=on -c statement_timeout=30000" \
psql -X -v ON_ERROR_STOP=1
```

Run read-only statements only, even if the credentials unexpectedly allow writes. Inspect schemas before assuming table or column names. Bound exploratory queries with selective filters and `LIMIT`; do not run `EXPLAIN ANALYZE` or broad scans without the user's approval.

## Write access

Use `POSTGRES_RW_URL` only after the user explicitly requests write access and specifies the intended change. Before connecting with it:

1. Use the read-only connection to preview the exact affected rows and count.
2. Show the planned mutation and impact, then get confirmation immediately before execution.
3. Use restrictive predicates, preferably explicit primary keys. Never run an unbounded `UPDATE` or `DELETE`.

Connect with:

```bash
PGDATABASE="$POSTGRES_RW_URL" \
PGOPTIONS="-c statement_timeout=30000 -c lock_timeout=5000" \
psql -X -v ON_ERROR_STOP=1
```

Execute mutations inside an explicit transaction. Inspect `RETURNING` output or the affected row count before `COMMIT`; use `ROLLBACK` if it differs from the confirmed plan. Verify the result afterward through `POSTGRES_RO_URL`.

Write access alone never authorizes schema changes, `TRUNCATE`, or `DROP`. Perform those only when the user explicitly names the operation and confirms it after a clear irreversible-impact warning.

Treat query results as sensitive. Return only the rows or aggregates needed to answer the request, and do not save raw results unless the user explicitly asks.
