const express = require("express");
const logger = require("morgan");
const bodyParser = require("body-parser");
const cors = require("cors");
const passport = require("passport");
const auth = require("./routes/auth");
const strategy = require("./services/passport");
// set up the express app
const app = express();

// Log requests to the console
app.use(logger("dev"));
// Parse incoming requests data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());

// needed for initializing auth flow
passport.use(strategy);
app.use(passport.initialize());

// handles all authentication and authorization routes
app.use("/auth", auth);
// handles all routes pertaining to user information
app.use("/profile", require("./routes/profile"));
// hnadles all routes pertaining to food storage

// handles all routes pertaining to user nutrtition

//handles all routes pertaining to user exercises
app.use("/exercise", require("./routes/exerciseRoutes"));
// USER Authentication and Registration route
// require("./routes/authroutes")(app);
// require("./routes/userFood")(app);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log("app is running on port " + PORT);
});
