require_relative './impl.rb'
require 'pry'

User = Struct.new(:name, :email, :amount)

users = [
  User.new('Joe', 'joe@doe.com',  1200),
  User.new('Jane', 'jane@doe.com', -200),
  User.new('Doe', 'doe@doe.com',  4000),
]

view = View.new(File.read('template.erb'), users: users)

puts view.render