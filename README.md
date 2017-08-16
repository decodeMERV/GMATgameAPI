# GMATgameAPI
Backend of GMATgame

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

3. gmax.js

Includes all of the methods for our database queries
