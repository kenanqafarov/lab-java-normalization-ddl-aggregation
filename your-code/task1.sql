-- I created database here -- 
CREATE DATABASE IF NOT EXISTS blogdb;

-- Then I use this database --
use blogdb;


-- I create authors table here --
CREATE TABLE IF NOT EXISTS authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- I create articles table heree -- 
CREATE TABLE IF NOT EXISTS articles (
    article_id INT PRIMARY KEY,
    author_id INT NOT NULL,
    title VARCHAR(255)  NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Then we add some data to authors' table -- 
INSERT INTO authors (author_id, name) VALUES
    (1,'Maria Charlotte'),
    (2,'Juan Perez'),
    (3,'Kenan Gafarov');

-- Then we add some data to articles' table -- 
INSERT INTO articles (article_id, author_id, title, word_count, views) VALUES
    (1,3,'Best Paint Colors',814,14),
    (2,2,'Small Space Decorating Tips',1146, 221),
    (3,1,'Hot Accessories',986,105),
    (4,1,'Mixing Textures',765,22),
    (5,2,'Kitchen Refresh', 1242,307),
    (6,1,'Homemade Art Hacks',1002,193),
    (7,3,'Refinishing Wood Floors',1571,7542);
    

-- We get all data to show in output from articles --
SELECT * FROM articles;

-- We get all data to show in output from authors --
SELECT * FROM authors;

