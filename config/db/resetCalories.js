const cron = require("node-schedule");
const rule = new cron.RecurrenceRule();

const db = require("./database");

rule.hour = 24;
rule.minute = 0;
cron.scheduleJob(rule, function() {
  db("users").update("daily_calorie", 0);
});
