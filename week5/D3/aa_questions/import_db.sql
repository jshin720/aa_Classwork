PRAGMA foreign_keys = ON;



DROP TABLE IF EXISTS users;
CREATE TABLE users ( 
  id INTEGER PRIMARY KEY,
  fname TEXT, 
  lname TEXT
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  author_id INTEGER NOT NULL, 
  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  parent_id INTEGER NOT NULL,
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL, 

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO users(fname, lname)
VALUES ('Liam', 'Williams'), ('Jeff', 'Shin');

INSERT INTO questions(title, body, author_id)
VAlUES ('Problems', 'I have a problem.', 1), -- (SELECT id FROM users WHERE fname = 'Liam')
('Warcraft', 'Which Warcraft expansion.', 2); -- (SELECT id FROM users WHERE fname = 'Jeff')

-- INSERT INTO replies(body)
-- VAlUES ('Stuff'), -- (SELECT id FROM users WHERE fname = 'Liam')
-- ('Warcraft', 'Which Warcraft expansion.', 2); -- (SELECT id FROM users WHERE fname = 'Jeff')
