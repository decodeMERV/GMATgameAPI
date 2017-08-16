const express = require('express');
const util = require('../lib/util.js');

const onlyLoggedIn = require('../lib/only-logged-in');

module.exports = (dataLoader) => {
  const questionController = express.Router();

  // Retrieve next question
  questionController.get('/nextQuestion', (req, res) => { //should we put questions/nextQuestion bc *index.js line 44
    console.log(req, "JUST WANT TO SEE IF IT GETS THERE")
    dataLoader.getNextQuestion(req.query.currentLevel, req.query.isCorrect === 'true' ? true : req.query.isCorrect === 'false' ? false : undefined)
      .then(data => res.json(data))
      .catch(err => util.sendErrorResponse(res, err, 'AHAHAHAHA'));
  });

  // // Retrieve a single question
  // questionController.get('/:id', onlyLoggedIn, (req, res) => {
  //   dataLoader.getQuestion(req.query.currentLevel, req.query.isCorrect)
  //     .then(data => res.json(data[0]))
  //     .catch(err => util.sendErrorResponse(res, err));
  // });



  return questionController;
};
