const express = require("express");
const logger = require("morgan");
const bodyParser = require("body-parser");
const cors = require("cors");

// set up the express app
const app = express();

// Log requests to the console
app.use(logger("dev"));
// Parse incoming requests data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());

// USER Authentication and Registration route
require("./routes/authroutes")(app);
require("./routes/userFood")(app);

app.listen(3000, () => {
  console.log("app is running on port 3000");
});
