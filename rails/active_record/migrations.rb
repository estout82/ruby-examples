#!/usr/bin/env ruby

# datatypes
t.primary_key
t.string
t.text
t.integer
t.bigint
t.float
t.decimal
t.numeric
t.datetime
t.time
t.date
t.binary
t.blob
t.boolean
t.references

rename_table :old_name, :new_name                                       # renames a table
rename_column :table, :old_column, :new_column
drop_table :table_name                                                  # drops a table

change_table :table do |table|
  t.rename :old_column, :new_column
end