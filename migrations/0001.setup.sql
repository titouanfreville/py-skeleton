CREATE TYPE task_status as enum ('backlog', 'to do', 'ongoing', 'done');
CREATE TABLE tasks (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description VARCHAR NOT NULL DEFAULT NULL,
    state created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    last_updated_at TIMESTAMPTZ NULL
);