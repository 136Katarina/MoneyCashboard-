DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE stores;



CREATE TABLE stores (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  tag_category VARCHAR(255),
  image_location VARCHAR(255)
  );


CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  transaction_date DATE,
  store_id INT4 REFERENCES stores(id),
  tag_id INT4 REFERENCES tags(id),
  amount INT4,
  note VARCHAR(255)
  );
