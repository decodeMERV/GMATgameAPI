module.exports = (req, res, next) => {
  console.log("Checking if admin")
  if (req.user.admin !== undefined && req.user.admin) {
    next();
  }
  else {
    res.status(401).json({error: 'unauthorized - not logged in'});
  }
}