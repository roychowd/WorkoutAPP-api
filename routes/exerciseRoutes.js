const express = require("express");
const router = express.Router();
const exercises = require("../config/db/exerciseModel");

router.get("/", (req, res) => {
  res.send("hi");
});

router.get("/category/:muscle", (req, res) => {
  console.log(req.params.muscle);
  //   exercises.forge({ muscle: req.params.muscle }).fetchAll();
});

module.exports = router;
