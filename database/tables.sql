DROP DATABASE IF EXISTS gmax;

CREATE DATABASE gmax;

USE gmax;

CREATE TABLE users (

  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(60) NOT NULL,
  interests VARCHAR(250) NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
 id INT AUTO_INCREMENT PRIMARY KEY,
 userId INT,
 FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
 token VARCHAR(250) NOT NULL UNIQUE
);

CREATE TABLE questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(500) NULL,
  answerA VARCHAR(50) NULL,
  answerB VARCHAR(50) NULL,
  answerC VARCHAR(50) NULL,
  answerD VARCHAR(50) NULL,
  answerE VARCHAR(50) NULL,
  category INT,
  FOREIGN KEY (category) REFERENCES users (id) ON DELETE CASCADE,
  level ENUM ('200','300','400') DEFAULT '200',
  correctAnswer ENUM ('A', 'B', 'C', 'D', 'E') NOT NULL,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/*
need to figure this one out
/*
CREATE TABLE category (
  id INT AUTO_INCREMENT PRIMARY KEY,
);

MOCK DATA

ALTER TABLE questions MODIFY COLUMN title VARCHAR(500);

INSERT INTO questions (title) VALUES ('Dr. Larson: Sleep deprivation is the cause of many social ills, ranging from irritability to potentially dangerous instances of impaired decision making. Most people today suffer from sleep deprivation to some degree. Therefore we should restructure the workday to allow people flexibility in scheduling their work hours.');

INSERT INTO questions (title, answerA, answerB, answerC, answerD, answerE, level, correctAnswer) VALUES ('A bat and a ball cost $1.10 in total. The bat costs $1.00 more than the ball. How much does the ball cost?', '$0.10', '$0.05', '$0.20', '$1.00', 'None of the above', '200', 'b');

INSERT INTO questions (title, answerA, answerB, answerC, answerD, answerE, level, correctAnswer) VALUES ('Solve: 5 + 5V5/ 10 + V500', '1/2', '2', '1 + V5', '1 + 5V5', '5 + V5', '200', 'A');

DELETE FROM questions WHERE id=5;

NEED TO VERIFY THIS ONE WITH ZIAD

CREATE TABLE PERFORMANCE (
  userId INT AUTO_INCREMENT PRIMARY KEY,
  questionId INT NULL,
);
*/
