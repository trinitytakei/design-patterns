-- Generate initial database! From the command line:
--
-- cat seed.sql | sqlite3 database.db
--
CREATE TABLE tasks(
  id INT,
  name VARCHAR(255)
);

INSERT INTO tasks VALUES(1,"Buy milk");
INSERT INTO tasks VALUES(2,"Water the plants");
INSERT INTO tasks VALUES(3,"Feed the dog");
INSERT INTO tasks VALUES(4,"Count until 42");
