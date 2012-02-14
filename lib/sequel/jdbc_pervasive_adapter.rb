# encoding: utf-8
require 'sequel'
require 'sequel/adapters/jdbc'

Sequel::JDBC::DATABASE_SETUP[:pervasive] = proc do |db|
  require 'sequel/adapters/jdbc/pervasive'
  require 'sequel-jdbc-pervasive-adapter/jpscs.jar'
  require 'sequel-jdbc-pervasive-adapter/pvjdbc2.jar'
  require 'sequel-jdbc-pervasive-adapter/pvjdbc2x.jar'

  Java::JavaClass.for_name("com.pervasive.jdbc.v2.Driver")

  db.extend(Sequel::JDBC::Pervasive::DatabaseMethods)
  java.sql.DriverManager.registerDriver("com.pervasive.jdbc.v2.Driver");
end
