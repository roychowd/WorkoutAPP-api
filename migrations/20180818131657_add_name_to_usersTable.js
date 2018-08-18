exports.up = function(knex, Promise) {
  return knex.schema.table("usersTable", table => {
    table.string("firstName");
    table.string("lastName");
  });
};

exports.down = function(knex, Promise) {
  knex.schema.table("usersTable", table => {
    table.dropColumn("firstName");
    table.dropColumn("lastName");
  });
};
