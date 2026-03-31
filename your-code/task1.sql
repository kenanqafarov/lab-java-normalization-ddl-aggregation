-- I create the database here --
CREATE DATABASE IF NOT EXISTS blogdb;

-- Then I use this database --
USE blogdb;

-- I drop tables first to avoid conflicts on re-run --
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS authors;

-- I create the authors table here --
CREATE TABLE authors (
                         id          INT             PRIMARY KEY,
                         name        VARCHAR(100)    NOT NULL UNIQUE
);

-- I create the posts table here --
CREATE TABLE posts (
                       id          INT             PRIMARY KEY,
                       author_id   INT             NOT NULL,
                       title       VARCHAR(255)    NOT NULL UNIQUE,
                       word_count  INT             NOT NULL CHECK (word_count > 0),
                       views       INT             NOT NULL DEFAULT 0 CHECK (views >= 0),
                       CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Then I add some data to the authors table --
INSERT INTO authors (id, name) VALUES
                                   (1, 'Maria Charlotte'),
                                   (2, 'Juan Perez'),
                                   (3, 'Gemma Alcocer');

-- Then I add some data to the posts table --
INSERT INTO posts (id, author_id, title, word_count, views) VALUES
                                                                (1, 1, 'Best Paint Colors',          814,  14),
                                                                (2, 2, 'Small Space Decorating Tips',1146, 221),
                                                                (3, 1, 'Hot Accessories',            986,  105),
                                                                (4, 1, 'Mixing Textures',            765,  22),
                                                                (5, 2, 'Kitchen Refresh',            1242, 307),
                                                                (6, 1, 'Homemade Art Hacks',         1002, 193),
                                                                (7, 3, 'Refinishing Wood Floors',    1571, 7542);

-- I get all data from the posts table --
SELECT * FROM posts;

-- I get all data from the authors table --
SELECT * FROM authors;