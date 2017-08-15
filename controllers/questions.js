const express = require('express');

const onlyLoggedIn = require('../lib/only-logged-in');

module.exports = (dataLoader) => {
  const questionController = express.Router();


  // Retrieve a single question
  questionController.get('/questions/:id', onlyLoggedIn, (req, res) => {

    dataLoader.getQuestion(req.params.id)
      .then(data => res.json(data[0]))

      .catch(err => res.status(400).json(err));
  });

  /*
  Add more requests in here for extra features
  */

  return questionController;
  };
