SELECT 1;
SELECT 1 + 2;
SELECT 1, 2 , 1 + 2

SELECT 1 AS "one";
SELECT 1, 'one';
SELECT 1 + 2;
SELECT 1, 2 , 1 + 2

CREATE TABLE authors
(
    id SERIAL PRIMARY KEY,
    username VARCHAR UNIQUE NOT NULL
);

ALTER TABLE authors
ADD COLUMN email VARCHAR UNIQUE;

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    body TEXT NOT NULL DEFAULT '',
    author_id INT NOT NULL,

    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
            REFERENCES authors (id)
);

SELECT *
FROM authors
ORDER BY id DESC
;

SELECT username
FROM authors
ORDER BY id DESC;

--INSERT INTO authors (username)
--VALUES ('Kate');



INSERT INTO authors (username, email)
VALUES
    ('Ted', 'ted@example.com'),
    ('Bob', 'bob@yandex.ru');

UPDATE authors
SET username = 'Sem'
WHERE username = 'Samuel'

SELECT id, email, username
FROM authors
WHERE
    length(username) = 4
    AND email is NULL;

UPDATE authors
SET email = concat(username, '@ya.ru')
WHERE
    length(username) = 4
    AND email is NULL;

SELECT id, username, email
FROM authors
ORDER BY id
LIMIT 2
OFFSET 4;

SELECT *
FROM authors
WHERE email LIKE '%@ya.ru';

SELECT *
FROM authors
WHERE email NOT LIKE '%@ya.ru' OR email IS NULL;

INSERT INTO posts (title, author_id)
VALUES ('ql Lesson', 4),
       ('Hi Bill', 14);

SELECT *
FROM posts p
JOIN authors a on a.id = p.author_id
WHERE a.username = 'Sem';

SELECT a.id, a.username, p.id, p.title
FROM authors a
LEFT OUTER JOIN posts p on a.id = p.author_id;