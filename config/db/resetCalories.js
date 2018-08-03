const cron = require("node-schedule");

const db = require("./database");

cron.scheduleJob("0 0 * * *", function() {
  db("users").update("daily_calorie", 0);
});
