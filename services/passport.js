//  FILE USED TO CONFIGURE PASSPORT JS
const dotenv = require("dotenv");
dotenv.config();
const passport = require("passport");
const passportJWT = require("passport-jwt");
const jwt = require("jsonwebtoken");
const JWTstrategy = passportJWT.Strategy;
const extractJWT = passportJWT.ExtractJwt;
const User = require("../config/db/userModel");

const opts = {
  jwtFromRequest: extractJWT.fromAuthHeaderAsBearerToken(),
  secretOrKey: process.env.SECRET_OR_KEY
};

const strategy = new JWTstrategy(opts, (payload, next) => {
  //GET USER FROM DB
  User.forge({ id: payload.id })
    .fetch()
    .then(res => {
      next(null, res);
    });
});

module.exports = strategy;
