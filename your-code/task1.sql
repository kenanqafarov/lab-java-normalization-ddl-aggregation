CREATE DATABASE IF NOT EXISTS blogdb;
USE blogdb;

CREATE TABLE IF NOT EXISTS authors (
                                       author_id INT AUTO_INCREMENT PRIMARY KEY,
                                       name VARCHAR(100) NOT NULL
    );

CREATE TABLE IF NOT EXISTS articles (
                                        article_id INT AUTO_INCREMENT PRIMARY KEY,
                                        author_id  INT NOT NULL,
                                        title      VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views      INT NOT NULL DEFAULT 0,

    CONSTRAINT fk_author
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
    );

INSERT INTO authors (name) VALUES
                               ('Maria Charlotte'),
                               ('Juan Perez'),
                               ('Kenan Gafarov');

INSERT INTO articles (author_id, title, word_count, views) VALUES
                                                               (3, 'Best Paint Colors', 814, 14),
                                                               (2, 'Small Space Decorating Tips', 1146, 221),
                                                               (1, 'Hot Accessories', 986, 105),
                                                               (1, 'Mixing Textures', 765, 22),
                                                               (2, 'Kitchen Refresh', 1242, 307),
                                                               (1, 'Homemade Art Hacks', 1002, 193),
                                                               (3, 'Refinishing Wood Floors', 1571, 7542);

SELECT * FROM articles;
SELECT * FROM authors;