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
ALTER TABLE posts ADD COLUMN cat VARCHAR(45);

INSERT INTO posts(`title`, `desc`, `img`, `date`, `uid`) VALUES('test', 'test desc', 'test_url', '2024-07-01', 1);
INSERT INTO posts(`title`, `desc`, `img`, `date`, `uid`) VALUES(
"Introducing Gemini: The Next Generation AI", "Google unveils Gemini, a revolutionary AI platform designed to enhance productivity and creativity across various applications.","https://media.istockphoto.com/id/1403500817/photo/the-craggies-in-the-blue-ridge-mountains.jpg?s=612x612&w=0&k=20&c=N-pGA8OClRVDzRfj_9AqANnOaDS3devZWwrQNwZuDSk=", '2024-07-01', 1
);
UPDATE posts SET cat='technology' WHERE id=3;

INSERT INTO posts(`title`, `desc`, `img`, `date`, `uid`) VALUES (
  "Sustainability Initiatives: Google’s Road to Net Zero",
  "Google outlines its comprehensive sustainability strategy, focusing on achieving net zero emissions by 2030.", "https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?cs=srgb&dl=pexels-pixabay-206359.jpg&fm=jpg", '2024-06-01', 1
);