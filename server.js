const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const bcrypt = require("bcrypt-nodejs");
const cors = require("cors");
const knex = require("knex");
const keys = require("./keys/keys");

const db = knex({
  client: "pg",
  connection: {
    host: "127.0.0.1",
    user: "postgres",
    password: "",
    database: "MarinaFood"
  }
});

app.use(bodyParser.json());
app.use(cors());
// db.select("*")
//   .from("Food")
//   .then(console.log);
// app.post('/signin', (req, res) => {
//     db.select
// })

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
    const { email, name, password } = req.body;
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
              joined: new Date()
            })
            .then(user => {
              res.json(user[0]);
            });
        })
        .then(trx.commit)
        .catch(trx.rollback);
    }).catch(err => res.status(400).json("unable to register"));
  });
  

app.listen(3000, () => {
  console.log("app is running on port 3000");
});