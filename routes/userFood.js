const db = require("../config/db/database");

module.exports = app => {

  app.get("/profile/:id/calories", (req, res) => {
    const id = req.params.id;
    db("users")
      .where({
        id: id
      })
      .select("caloric_goals", "daily_calorie")
      .then(data => console.log(data))
      .catch(err => res.status(400).json("error putting users Caloric Goals"));
  });




};
