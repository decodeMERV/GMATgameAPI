# GMATgameAPI
Backend of GMATgame

Controllers

1. auth.js
methods for making API calls to our database (post, get, delete, patch, put)
-it imports the middleware and routing modules needed to run the API requests:
-instance of express 
-util file (cryptography and error handling)
-onlyLoggedin (required to fire off GET/POST)
 
-const express = require(‘express’);
—> defines the routes as express

-Includes all of the authorization API calls to the DB

2. questions.js

Includes the GET methods for fetching the questions from the DB (API calls)

database

1. Includes our SQL tables for our database.

lib

1. gmax.js

This file defines of all of our main methods, including the infamous dataLoader(the method that used to initialize new instances when the server kicks off). It also imports all of the Express and NPM middleware dependencies for running the backend code. These include: bcrypt(hashing passwords), knex(MYSQL queries), validations.js (customized middleware for validating users), md5 (on-the-fly email hashing for retrieving user Gravatars),etc. The main methods are: create new user, login, logout, retrieve current user, get new questions from the DB.

2. check-login-token.js

This file checks the headers for login authorization and moves to the next middleware if successful. If there is no valid token, an error message is returned.


3.only-logged-in.js

Sends a request to check if the user is logged in.

4. util.js

This file is a central utility module for error handling and basic cryptography. It the basic hashing methods such as getRandomToken and joinKeys.

5. validations.js

This file handles the validation methods for users and credentials. It imports the NPM module 'validate.js' which is used for validating object properties in javascript.

Main folder

4. index.js

This is the main file that initializes the Express server, the SQL database connection, CORS, controllers, middleware, and runs the main files of the app (/questions, /auth) etc.

apiary.apib

This document includes the API contracts for the frontend and backend. You follow this format in order to make API calls. 


