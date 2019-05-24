CREATE TABLE contracts(
    id SERIAL,
    organization_id INTEGER,
    category varchar(255),
    description text,
    created_at timestamp);