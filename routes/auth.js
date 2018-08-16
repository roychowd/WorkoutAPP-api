const express = require("express");
const router = express.Router();
const User = require("../config/db/userModel");
const jwt = require("jsonwebtoken");
const passport = require("passport");

router.get("/", (req, res) => {
  res.send("Hello world");
});

router.post("/seedUser", (req, res) => {
  console.log(req.body);
  if (!req.body.email || !req.body.password) {
    return res.status(401).send("Error: INVALID credientals");
  }
  User.forge({ email: req.body.email })
    .fetch()
    .then(result => {
      if (!result) {
        const user = new User({
          email: req.body.email,
          password: req.body.password
        });
        user.save().then(user => {
          res.send({ id: user.id });
        });
      } else {
        return res.status(401).send("ERROR");
      }
    })
    .catch(err => res.status(400).send("Errors"));
});

// == this is a test route to get the json web token of the user == //
router.post("/getToken", (req, res) => {
  console.log(req.body);
  if (!req.body.email || !req.body.password) {
    return res.status(401).send("Error: INVALID credientals");
  }

  User.forge({ email: req.body.email })
    .fetch()
    .then(result => {
      console.log(result);
      if (!result) {
        return res.status(400).send("User not found!");
      }
      result
        .authenticate(req.body.password)
        .then(user => {
          const payload = { id: user.id };
          const token = jwt.sign(payload, process.env.SECRET_OR_KEY); // uses bcrypt to hash the token
          res.send(token);
        })
        .catch(err => {
          return res.status(401).send("error with retrieving tokenization");
        });
    });
});

// === This is just a test route to ensure that jwt cookies will work! ==== //
router.get(
  "/protected",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    res.send("Im protected");
  }
);

router.get(
  "/getUser",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    res.send(req.user);
  }
);

module.exports = router;
