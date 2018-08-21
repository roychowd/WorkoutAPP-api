exports.up = function(knex, Promise) {
  return knex.schema.createTable("workouts", table => {
    table
      .string("Exercise")
      .notNull()
      .primary();
    table.string("Equipment");
    table.string("Exercise_Type").notNull();
    table.string("Major_Muscle").notNull();
    table.string("Minor_Muscle");
    table.string("Example");
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable("workouts");
};
