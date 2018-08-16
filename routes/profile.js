const express = require("express");
const router = express.Router();
const User = require("../config/db/userModel");


router.get("/", (req, res) => {
  res.send("hi");
});

router.put("/:id/dailyCal", (req, res) => {
  const desiredCalories = req.body.calories;
  User.forge({ id: req.params.id })
    .fetch({ require: true })
    .then(user => {
      user
        .save({
          daily_Calories: desiredCalories
        })
        .catch(err => {
          res.status(500).json({ error: true, data: err });
        });
    })
    .catch(err => res.status(500).json({ error: true, data: err }));
});

module.exports = router;
