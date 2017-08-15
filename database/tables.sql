DROP DATABASE IF EXISTS gmax;

CREATE DATABASE gmax;

USE gmax;

CREATE TABLE User_Profile (

  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(60) NOT NULL,
  interests VARCHAR(250) NULL,
  photo VARCHAR(200) NULL,
  userRank ENUM ('beginner', 'intermediate', 'expert') DEFAULT 'beginner',
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userId INT NOT NULL REFERENCES users (id) ON DELETE CASCADE,
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
  category ENUM ('math', 'critical reasoning') DEFAULT 'math',
  level ENUM ('200','300', '400') DEFAULT '200',
  correctAnswer ENUM ('a', 'b', 'c', 'd', 'e') DEFAULT 'c',
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/*

MOCK DATA

ALTER TABLE questions MODIFY COLUMN title VARCHAR(500);

INSERT INTO questions (title) VALUES ('Dr. Larson: Sleep deprivation is the cause of many social ills, ranging from irritability to potentially dangerous instances of impaired decision making. Most people today suffer from sleep deprivation to some degree. Therefore we should restructure the workday to allow people flexibility in scheduling their work hours.');

INSERT INTO questions (title, answerA, answerB, answerC, answerD, answerE, category, level, correctAnswer)

VALUES ('A bat and a ball cost $1.10 in total. The bat costs $1.00 more than the ball. How much does the ball cost?', '$0.10', '$0.05', '$0.20', '$1.00', 'None of the above, 'critical reasoning', '200', 'b');

NEED TO VERIFY THIS ONE WITH ZIAD

CREATE TABLE PERFORMANCE (
  userId INT AUTO_INCREMENT PRIMARY KEY,
  questionId INT NULL,
);
*/
