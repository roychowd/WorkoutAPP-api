const express = require("express");
const router = express.Router();
const User = require("../config/db/userModel");
const jwt = require("jsonwebtoken");
const passport = require("passport");

router.get("/", (req, res) => {
  res.send("hi");
});

router.put("/:id/overall_calories", (req, res) => {
  const id = req.params.id;
  const desiredCalories = req.body.calories;
  db("usersTable")
    .where("id", "=", id)
    .update({
      caloric_goals: desiredCalories
    })
    .returning(["daily_calorie", "caloric_goals"])
    .then(calories => res.json(calories[0]))
    .catch(err => res.status(400).json("error putting users Caloric Goals"));
});

module.exports = router;
