CREATE SCHEMA bookstore;
ALTER DATABASE bookstore SET search_path = bookstore, public;
CREATE TABLE bookstore.authors(
  author_id serial PRIMARY KEY,
  last_name text,
  first_name text,
  middle_name text
);

INSERT INTO authors(last_name, first_name, middle_name) VALUES ('Пушкин', 'Александр', 'Сергеевич');
INSERT INTO authors(last_name, first_name, middle_name) VALUES ('Тургенев', 'Иван', 'Сергеевич');
INSERT INTO authors(last_name, first_name, middle_name) VALUES ('Стругацкий', 'Борис', 'Натанович');
INSERT INTO authors(last_name, first_name, middle_name) VALUES ('Стругацкий', 'Аркадий', 'Натанович');
INSERT INTO authors(last_name, first_name, middle_name) VALUES ('Толстой', 'Лев', 'Николаевич');
