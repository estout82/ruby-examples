


ActiveRecord::Base.connection                                       # gets the connection (database agnostic)
ActiveRecord::Base.connection.raw_connection                        # gets the actual data base adapter (eg PG::Connection)

#
# pg
#

ActiveRecord::Base.connection.raw_connection.prepare(               # create a prepared statement
  "query_name",
  "select * from users where users.name = $1"
)

ActiveRecord::Base.connection.raw_connection.exec_prepared(         # execute a prepared statement by name
  "query_name",
  [{value:"jim"}] # array of hashes for values
)