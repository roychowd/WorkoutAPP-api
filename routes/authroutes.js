/*
================= USED FOR USER AUTHENTICATION AND REGISTRATION ======================== 
*/

const db = require("../config/db/database");
const bcrypt = require("bcrypt-nodejs");

module.exports = app => {
  app.post("/signin", (req, res) => {
    db.select("email", "hash")
      .from("login")
      .where("email", "=", req.body.email)
      .then(data => {
        const isValid = bcrypt.compareSync(req.body.password, data[0].hash);
        if (isValid) {
          db.select("*")
            .from("users")
            .where("email", "=", req.body.email)
            .then(user => {
              res.json(user[0]);
            })
            .catch(err => res.status(400).json("unable to get user"));
        } else {
          res.status(400).json("wrong credentials");
        }
      })
      .catch(err => res.status(400).json("wrong credentials"));
  });

  app.post("/register", (req, res) => {
    const { email, name, password, gender } = req.body;
    const hash = bcrypt.hashSync(password);
    db.transaction(trx => {
      trx
        .insert({
          hash: hash,
          email: email
        })
        .into("login")
        .returning("email")
        .then(loginEmail => {
          return trx("users")
            .returning("*")
            .insert({
              email: loginEmail[0],
              name: name,
              joined: new Date(),
              gender: gender
            })
            .then(user => {
              res.json(user[0]);
            });
        })
        .then(trx.commit)
        .catch(trx.rollback);
    }).catch(err => res.status(400).json("unable to register"));
  });

  // needed to update the calroic goals of the user inside the db === //
  app.put("/profile/:id/overall_calories", (req, res) => {
    const id = req.params.id;
    const desiredCalories = req.body.calories;
    console.log(id, desiredCalories);
    db("users")
      .where("id", "=", id)
      .update({
        caloric_goals: desiredCalories
      })
      .returning("caloric_goals")
      .then(calories => res.json(calories[0]))
      .catch(err => res.status(400).json("error putting users Caloric Goals"));
  });
};
