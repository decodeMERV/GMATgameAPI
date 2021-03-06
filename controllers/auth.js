const express = require('express');
const util = require('../lib/util.js');
const onlyLoggedIn = require('../lib/only-logged-in');

module.exports = (dataLoader) => {
  const authController = express.Router();

  // Create a new user (SIGNUP)
  authController.post('/users', (req, res) => {
    dataLoader.createUser({
      username: req.body.username,
      email: req.body.email,
      password: req.body.password,
      interests: req.body.interests
    })
    .then(user => res.status(201).json(user))
    .catch((error) => {
      console.log(error, "the error in auth.js");
      res.status(400).json(error)
    });
  });


  // Create a new session (LOGIN)
  authController.post('/sessions', (req, res) => {
    dataLoader.createTokenFromCredentials(
      req.body.email,
      req.body.password
    )
    .then(token => res.status(201).json({ token: token }))
    .catch(err => res.status(401).json({ error: 'Something went wrong!' }));
  });

  // Delete a session (LOGOUT)
  authController.delete('/sessions', onlyLoggedIn, (req, res) => {
    dataLoader.deleteToken(req.sessionToken)
      .then(() => res.status(204).end())
      .catch(err => util.sendErrorResponse(res, err));
  });


  // Retrieve current user

  authController.get('/me', onlyLoggedIn, (req, res) => {
    if (req.sessionToken) {
      dataLoader.getUserFromSession(req.sessionToken)
        .then(data => res.json(data))
        .catch(err => util.sendErrorResponse(res, err));
    } else {
      res.status(401).json({ error: 'Invalid session token, try signing in again!' });
    }
  });

  // Update user profile
  authController.patch('/me', onlyLoggedIn, (req, res) => {
    dataLoader.getProfileUpdate({
      username: req.body.username,
      email: req.body.email,
      interests: req.body.interests
    }, req.body.token)
    .then(user => res.status(201).json(user))
    .catch(err => util.sendErrorResponse(res, err));
  });

  return authController;
};
