const express = require('express');
const util = require('../lib/util.js');

const onlyLoggedIn = require('../lib/only-logged-in');

module.exports = (dataLoader) => {
  const questionController = express.Router();

  // Retrieve next question
  questionController.get('/nextQuestion', (req, res) => { //should we put questions/nextQuestion bc *index.js line 44

    dataLoader.getNextQuestion(req.query.currentLevel, req.query.isCorrect === 'true' ? true : req.query.isCorrect === 'false' ? false : undefined)
      .then(data => res.json(data))
      .catch(err => util.sendErrorResponse(res, err));
  });

  questionController.post('/insert', (req, res) => {
    if (req.user.admin) {
      dataLoader.insertQuestion(req.body)
        .then(data => res.status(201).json(data))
        .catch(() => res.status(400).json({ error: 'Something went wrong when inserting to database' }));
    }
    else {
      return res.status(401).json({ error: 'unauthorized - not logged in' });
    }
  })

  questionController.delete('/delete', (req, res) => {
    if (req.user.admin) {
      dataLoader.deleteQuestion(req.body)
        .then(data => res.status(200).json(data))
        .catch(() => res.status(400).json({error: 'Something went wrong when deleting to database' }));
    }
    else {
      return res.status(401).json({ error: 'unauthorized - not logged in' });
    }
  })
  // // Retrieve a single question
  // questionController.get('/:id', onlyLoggedIn, (req, res) => {
  //   dataLoader.getQuestion(req.query.currentLevel, req.query.isCorrect)
  //     .then(data => res.json(data[0]))
  //     .catch(err => util.sendErrorResponse(res, err));
  // });

  return questionController;
};
