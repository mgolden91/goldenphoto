# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(:email => "mgolden91@gmail.com", :role => "admin", :password => "helloworld", :password_confirmation => "helloworld", :username => "mattyg" )
User.create!(:email => "member@gmail.com", :role => "member", :password => "helloworld", :password_confirmation => "helloworld", :username => "member" )
User.create!(:email => "friend@gmail.com", :role => "friend", :password => "helloworld", :password_confirmation => "helloworld", :username => "friend" )
