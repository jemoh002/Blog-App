CREATE TABLE users(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(45) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    img VARCHAR(255) NOT NULL
);
ALTER TABLE users MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE users MODIFY COLUMN img VARCHAR(255);

INSERT INTO users (username, email, password, img) VALUES ( 'test', 'test@gmail.com', 'tests', 'test_url');




CREATE TABLE posts(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    `desc` VARCHAR(255) NOT NULL,
    img VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    `uid` INT NOT NULL,
    CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES users(id)
);

INSERT INTO posts(`title`, `desc`, `img`, `date`, `uid`) VALUES('test', 'test desc', 'test_url', '2024-07-01', 1);
