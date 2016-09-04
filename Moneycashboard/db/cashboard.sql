DROP TABLE transactions;
DROP TABLE accounts;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE merchants (
  id serial4 primary key, 
  name VARCHAR(255)
  );

CREATE TABLE tags (
  id serial4 primary key,
  name VARCHAR(255)
  );

CREATE TABLE accounts (
  id serial4 primary key,
  type VARCHAR(255),
  balance numeric(10,2)
  );

CREATE TABLE transactions (
  id serial4 primary key,
  account_id INT8 references accounts(id),
  merchant_id INT8 references merchants(id),
  tag_id INT8 references tags(id),
  amount numeric(10,2),
  trans_date Date
  -- description VARCHAR(255),
  -- type VARCHAR(255)
);






