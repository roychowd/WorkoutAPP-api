const knex = require("knex");
const knexdb = knex({
  client: "pg",
  connection: {
    host: "127.0.0.1",
    user: "ankushsharma",
    password: "",
    database: "workoutdb"
  }
});

//ORM wrapper that allows you to query faster
const bookshelf = require("bookshelf");
//Module used to secure any password inside db with bcrypt
const securePassword = require("bookshelf-secure-password");
const db = bookshelf(knexdb);
//allows db to use bookshelf interface
db.plugin(securePassword);

module.exports = db;
