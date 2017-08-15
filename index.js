const express = require('express');
const mysql = require('promise-mysql');

// Express middleware
const bodyParser = require('body-parser');
const morgan = require('morgan');
const checkLoginToken = require('./lib/check-login-token.js');

// Data loader
const gmaxDataLoader = require('./lib/gmax.js');

// Controllers
const authController = require('./controllers/auth.js');
const questionController = require('./controllers/questions.js'); //needs to be modified?

// Database / data loader initialization with SQL
const connection = mysql.createPool({
  user: 'root',
  password: 'Alwaysbecrushing123', //for testing purposes, change this info to your local SQL password
  database: 'gmax'
});

const dataLoader = new DashboardlyDataLoader(connection);

// Express initialization
const app = express();

app.use(morgan('dev'));
app.use(bodyParser.json());
app.use(checkLoginToken(dataLoader));


// Set up CORS headers (without using NPM library- more customized this way!)
app.use(function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,POST,PATCH,DELETE,OPTIONS');
  res.header('Access-Control-Allow-Headers', 'Content-Type,Authorization');
  next();
})

app.use('/auth', authController(dataLoader));
app.use('/questions', questionController(dataLoader));

// Start the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  if (process.env.C9_HOSTNAME) {
    console.log(`Web server is listening on https://${process.env.C9_HOSTNAME}`);
  } else {
    console.log(`Web server is listening on http://localhost:${port}`);
  }
});
