const db = require("./database");

const User = db.Model.extend({
  tableName: "usersTable",
  hasSecurePassword: true
});

module.exports = User;
