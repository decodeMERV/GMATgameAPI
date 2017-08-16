module.exports = (req, res, next) => {
  console.log(req, "CHEKING REQ FOR ONLY LOGGED IN")
  if (req.user) {
    next();
  } else {
    res
    .status(401)
    .json({
      error: 'unauthorized - not logged in'
    });
  }
};
