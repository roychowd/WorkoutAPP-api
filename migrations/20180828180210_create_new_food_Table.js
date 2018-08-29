exports.up = function(knex, Promise) {
  return knex.schema.createTable("exercises", table => {
    table.integer("id").primary();
    table.string("categoryMuscle").notNull();
    table.string("exerciseName").notNull();
    table.string("force");
    table.string("gifURL");
    table.string("mechanics");
    table.text("message");
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable("exercises");
};
