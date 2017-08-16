const express = require('express');
const util = require('../lib/util.js');

const onlyLoggedIn = require('../lib/only-logged-in');

module.exports = (dataLoader) => {
  const questionController = express.Router();


  // Retrieve a single question
  questionController.get('/questions/:id', onlyLoggedIn, (req, res) => {
    dataLoader.getQuestion(req.params.currentQuestionLevel, req.params.isCorrect)
      .then(data => res.json(data[0]))
      .catch(err => util.sendErrorResponse(res, err));
  });

  // Retrieve next question
  questionController.get('/nextQuestion{?currentLevel,isCorrect}', onlyLoggedIn, (req, res) => {
    dataLoader.getNextQuestion(req.params.currentQuestionLevel, req.params.isCorrect)
      .then(data => res.json(data[0]))
      .catch(err => util.sendErrorResponse(res, err));
  });


  return questionController;
  };
