const express = require('express');
const util = require('../lib/util.js');

const onlyLoggedIn = require('../lib/only-logged-in');

module.exports = (dataLoader) => {
  const recordController = express.Router();


  recordController.post('/recorder',(req, res) => {

    console.log("req.body", req.body)

    dataLoader.recordQuestion({
    username: req.body.username,
    questionId: req.body.questionId,
    isCorrect: req.body.isCorrect,
    category: req.body.category,
    answer: req.body.answer,
    level: req.body.level,
    score: req.body.score,
    time: req.body.time
  })
    .then(data => res.status(201).json(data))
.catch(err => util.sendErrorResponse(res, err));
});


  recordController.get('/leaders', (req, res) => {

    dataLoader.getLeaders()
    .then(data => res.json(data))
.catch(err => util.sendErrorResponse(res, err));
});

  return recordController;
};
