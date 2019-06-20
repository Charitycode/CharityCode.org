CREATE TABLE organizations(
    id SERIAL,
    ein varchar(255),
    name varchar(255),
    tax_id varchar(255),
    classification varchar(255),
    focus varchar(255),
    email varchar(255),
    password varchar(255),
    created_at timestamp
    );

