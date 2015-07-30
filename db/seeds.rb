# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: 'associate')
Role.create(name: 'admin')
Role.create(name: 'superadmin')
User.create(email: '', password: '**')
User.first.roles.clear
User.first.roles << Role.last
