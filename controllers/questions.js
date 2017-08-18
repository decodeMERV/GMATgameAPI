const express = require('express');
const util = require('../lib/util.js');
const onlyAdmin = require('../lib/only-admin');

module.exports = (dataLoader) => {
  const questionController = express.Router();

  questionController.get('/nextQuestion', (req, res) => { //should we put questions/nextQuestion bc *index.js line 44

    dataLoader.getNextQuestion(req.query.currentLevel, req.query.isCorrect === 'true' ? true : req.query.isCorrect === 'false' ? false : undefined)
      .then(data => res.json(data))
      .catch(err => util.sendErrorResponse(res, err));
  });

  questionController.post('/', onlyAdmin, (req, res) => {
    dataLoader.insertQuestion(req.body)
      .then(data => res.status(201).json(data))
      .catch(() => res.status(400).json({ error: 'Something went wrong when inserting to database' }));
  })

  questionController.delete('/', onlyAdmin, (req, res) => {
    dataLoader.deleteQuestion(req.body)
      .then(data => res.status(200).json(data))
      .catch(() => res.status(400).json({error: 'Something went wrong when deleting to database' }));
  })

  return questionController;
};
