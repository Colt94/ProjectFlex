# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_list = [
    ["Grant", "exec"],
    ["Emily", "exec"],
    ["Kelsey", "exec"],
    ["Monty", "exec"],
    ["Kelly", "exec"],
    ["Ashley", "zl"],
    ["Jacob", "zl"],
    ["Catherine", "zl"],
    ["Maggie", "member"],
    ["Evan", "member"],
    ["Macy", "member"],
    ["Alex", "member"],
    ["Gia", "member"]
]

user_list.each do |name, permission|
    User.create(name: name, permissions: permission)
end