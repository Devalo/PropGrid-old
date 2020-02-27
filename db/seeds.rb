# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


PropertyUnit.all.each do |u|
  5.times do |i|
    u.todo_items.create(title: "Gjøremål #{1+i}", complete: i % 3  == 0 ? true : false)
  end
end
