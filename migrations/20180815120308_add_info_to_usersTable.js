exports.up = function(knex, Promise) {
  return knex.schema.table("usersTable", table => {
    table
      .timestamp("created_at")
      .defaultTo(knex.fn.now())
      .notNull();
    table
      .timestamp("updated_at")
      .defaultTo(knex.fn.now())
      .notNull();
    table.integer("daily_Calories").defaultTo(1800);
  });
};

exports.down = function(knex, Promise) {
  knex.schema.table("usersTable", table => {
    table.dropColumn("created_at");
    table.dropColumn("updated_at");
    table.dropColumn("daily_Calories");
  });
};
