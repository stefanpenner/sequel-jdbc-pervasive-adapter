# encoding: utf-8
require 'sequel'
require 'sequel/adapters/jdbc'

Sequel::JDBC::DATABASE_SETUP[:pervasive] = proc do |db|
  require 'sequel/adapters/jdbc/pervasive'
  db.extend(Sequel::JDBC::Pervasive::DatabaseMethods)
  java.sql.DriverManager.registerDriver("com.pervasive.jdbc.v2.Driver");
end
