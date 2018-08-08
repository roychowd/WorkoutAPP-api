const knex = require("knex");
const knexdb = knex({
  client: "pg",
  connection: {
    host: "127.0.0.1",
    user: "postgres",
    password: "",
    database: "MarinaFood"
  }
});

const bookshelf = require("bookshelf");
const securePassword = require("bookshelf-secure-password");
const db = bookshelf(knexdb);
db.plugin(securePassword);

module.exports = db;
