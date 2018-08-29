const db = require("./database");

const exercises = db.Model.extend({
  tableName: "exercises"
});

module.exports = exercises;
