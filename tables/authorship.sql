CREATE TABLE bookstore.authorship(
  book_id integer REFERENCES books,
  author_id integer REFERENCES authors,
  seq_num integer,
  PRIMARY KEY (book_id,author_id)
);

INSERT INTO authorship(book_id, author_id, seq_num) VALUES(1, 1, 1);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(2, 2, 1);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(3, 3, 2);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(3, 4, 1);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(4, 5, 1);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(5, 6, 1);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(6, 1, 1);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(6, 5, 2);
INSERT INTO authorship(book_id, author_id, seq_num) VALUES(6, 2, 3);