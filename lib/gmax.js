//All methods associated with the GMAX Logic Training Game

const bcrypt = require('bcrypt-as-promised');
const knex = require('knex')({ client: 'mysql' });
const validate = require('./validations');
const util = require('./util');
const md5 = require('js-md5');

const HASH_ROUNDS = 10;
const USER_FIELDS = ['id', 'username', 'email', 'interests', 'avatarUrl', 'createdAt', 'updatedAt'];
const USER_UPDATE_FIELDS = ['username', 'email', 'interests'];
const SIGNUP_FIELDS = ['id', 'username', 'email', 'interests', 'createdAt', 'updatedAt'];
const QUESTION_FIELDS = ['id', 'title', 'answerA', 'answerB', 'answerC', 'answerD', 'answerE', 'level', 'correctAnswer'];

//Dataloader class

class GmaxDataLoader {
  constructor(conn) {
    this.conn = conn;
  }
  query(sql) {
    return this.conn.query(sql);
  }

  // AUTH ONE OK SIGNUP

  // User methods
  createUser(userData) {
    const errors = validate.user(userData);
    if (errors) {
      console.log("error in validate ", errors)
      return Promise.reject({ errors: errors })

        .catch((error) => {
          // Special error handling for duplicate entry
          //console.log(error, "signup error")
          console.log("duplicate2",error)

            if (errors.password != null) {
              throw ({name: "pwd error", message: 'Password must be at least 12 characters.'});
            }
            else if (errors.email != null)
            {
              throw ({name: "email error", message: 'E-mail format is not valid.'});
            }
        });


    }

    return bcrypt.hash(userData.password, HASH_ROUNDS)
      .then((hashedPassword) => {
        return this.query(
          knex
            .insert({
              username: userData.username,
              email: userData.email,
              password: hashedPassword,
              interests: userData.interests
            })
            .into('users')
            .toString()
        );
      })
      .then((result) => {
        return this.query(
          knex
            .select(SIGNUP_FIELDS)
            .from('users')
            .where('id', result.insertId)
            .toString()
        );
      })
      .then(result => result[0])
      .catch((error) => {
        // Special error handling for duplicate entry
        //console.log(error, "signup error")
        console.log("duplicate2",error)

        if (error.code === 'ER_DUP_ENTRY') {
          throw ({name: "ER_DUP_ENTRY", message: 'A user with this email already exists'});
        } else {

          throw error;
        }
      });
    }

  //This method deletes the user (extra feature)
  deleteUser(userId) {
    return this.query(
      knex.delete().from('users').where('id', userId).toString()
    );
  }

  //Authorization: RETRIEVE CURRENT USER
  getUserFromSession(sessionToken) {
    return this.query(
      knex
       .select('users.id as id', 'users.email as email', 'users.createdAt as createdAt', 'users.updatedAt as updatedAt', 'users.admin as admin',  'users.username as username',  'users.interests as interests')
        .from('sessions')
        .join('users', 'sessions.userId', '=', 'users.id')
        .where({
          'sessions.token': sessionToken
        })
        .toString()
    )
      .then((result) => {
        if (result.length === 1) {
          /*
          added avatarURL property to user object returned by query, this method hashes
          the email address and returns a Gravatar image url to the auth/me
          */
          result[0].avatarUrl = 'https://www.gravatar.com/avatar/' + md5(result[0].email.toLowerCase()) + '?d=mm';
          return result[0];
        }
        return null;
      });
  }

  // AUTHORIZATION: LOGIN METHOD

  createTokenFromCredentials(email, password) {
    const errors = validate.credentials({
      email: email,
      password: password
    });
    if (errors) {
      return Promise.reject({ errors: errors });
    }

    let sessionToken;
    let user;
    return this.query(
      knex
        .select('id', 'password')
        .from('users')
        .where('email', email)
        .toString()
    )
      .then((results) => {
        if (results.length === 1) {
          user = results[0];
          return bcrypt.compare(password, user.password).catch(() => false);
        }

        return false;
      })
      .then((result) => {
        if (result === true) {
          return util.getRandomToken();
        }

        throw new Error('Username or password invalid');
      })
      .then((token) => {
        sessionToken = token;
        return this.query(
          knex
            .insert({
              userId: user.id,
              token: sessionToken
            })
            .into('sessions')
            .toString()
        );
      })
      .then(() => sessionToken);
  }


  // LOGOUT (DELETE SESSION) AUTH 3
  deleteToken(token) {
    return this.query(
      knex
        .delete()
        .from('sessions')
        .where('token', token)
        .toString()
    )
      .then(() => true);
  }


//This method retrieves the next question from the DB depending on the user's response

  getNextQuestion(currentLevel, isCorrect, username) {
    //store in a variable because we will re-use this same query selector method for both correct and incorrect responses from the user
    var query = (
      knex
        .select('questions.id as id', 'questions.title as title', 'questions.answerA as answerA', 'questions.answerB as answerB', 'questions.answerC as answerC', 'questions.answerD as answerD', 'questions.answerE as answerE', 'questions.categoryId as categoryId', 'questions.level as level', 'questions.correctAnswer as correctAnswer', 'category.name as categoryName')
        .from('questions')
        .join('category','questions.categoryId','=','category.id')
        .orderByRaw('RAND()')
        .limit(1)
    );

    if (currentLevel && isCorrect !== undefined) {
      query.andWhere('level', isCorrect ? '>=' : '<=', String(currentLevel)) //returns a question level that is higher than or less than the currentLevel if users answers correctly or not
    }
    else {
      query.andWhere('level', '=', '200')  //sets the next question to 200 level in all other cases (such as the beginning of the game)
    }
    // The below subquery along with the where NULL condition will filter out the most recent question (by Id) that was answered by the username, that is we are not serving back the same question twice in a row. 
    var subQuery = knex('leader_board').where('username', '=', username).orderBy('id', 'desc').limit(1).as('q2').select('questionId');
    query.leftJoin(subQuery, 'questions.id', '=', 'q2.questionId');
    query.whereNull('q2.questionId');

    return this.query(query.toString())
      .then(data => data[0]);
  }

  // Admin inserts row into the questions table via admin dashboard
  insertQuestion(questionInsObj) {
    var query = knex
      .insert({
        title: questionInsObj.title,
        answerA : questionInsObj.answerA,
        answerB : questionInsObj.answerB,
        answerC : questionInsObj.answerC,
        answerD : questionInsObj.answerD,
        answerE : questionInsObj.answerE,
        categoryId: questionInsObj.categoryId,
        level   : questionInsObj.level,
        correctAnswer : questionInsObj.correctAnswer
      })
      .into('questions')
      .toString();
    return this.query(
      query
    );
  }

  deleteQuestion(questionDelObj) {
    var query = knex('questions').where('id', questionDelObj.id).del().toString()
    return this.query(
      query
    );
  }

  getArrayOfQuestions(rowOffset, limit, catId, levelDifficulty) {
    var query =
      knex
        .select('questions.id as id', 'questions.title as title', 'questions.answerA as answerA', 'questions.answerB as answerB', 'questions.answerC as answerC', 'questions.answerD as answerD', 'questions.answerE as answerE', 'questions.categoryId as categoryId', 'questions.level as level', 'questions.correctAnswer as correctAnswer', 'category.name as categoryName')
        .from('questions')
        .join('category','questions.categoryId','=','category.id')
        .orderBy('questions.id', 'asc')
        .limit(limit > 10 || limit ? limit : 10)
        .offset(Number(rowOffset) || 0); //TODO: Why do we need to Number() this ?
    if (catId !== undefined && catId !== "undefined"){ // second "undefined" is for the string param in URL from the frontend
      query.andWhere('categoryId', catId)
    }
    if (levelDifficulty !== undefined && levelDifficulty !== "undefined"){
      query.andWhere('level', levelDifficulty)
    }
    return this.query(
      query.toString()
    );
  }

  recordQuestion(data) {
    return this.query(
      knex
        .insert({
          username: data.username,
          questionId: data.questionId,
          isCorrect: data.isCorrect,
          category: data.category,
          answer: data.answer,
          level: data.level,
          score: data.score,
          time: data.time
        })
        .into('leader_board')
        .toString()
    ).then(() => true)
  }

  getLeaders(){
    return this.query(
      knex
        .select('leader_board.username as user',knex.raw('SUM(leader_board.score) as total'),knex.raw('COUNT(leader_board.username) as cnt'),knex.raw('FORMAT(SUM(leader_board.time)/60000,2) as time'),knex.raw('MD5(LOWER(users.email)) as gravatar'))
        .from('leader_board')
          .join('users','leader_board.username', '=', 'users.username')
        .groupBy('leader_board.username')
        .orderByRaw('2 DESC')
        .limit(10)
        .toString()
    ).then(data => data)


  }

  getProfileUpdate(userInfo, sessionToken){
    return this.query(
      knex('users')
        .update(util.filterKeys(USER_UPDATE_FIELDS, userInfo))
        .join('sessions', 'sessions.userId', '=', 'users.id')
        .where({'sessions.token': sessionToken})
        .toString()
    );
  }
}

module.exports = GmaxDataLoader;
