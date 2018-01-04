# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Genres

if Genre.where(name: 'Science Fiction').nil?
  Genre.create!(name: 'Science Fiction')
end

if Genre.where(name: 'Programming').nil?
  Genre.create!(name: 'Programming')
end

# Create Books
#
if Book.where(name: 'Pragmatic Programmer').nil?
  programming = Genre.where(name: 'Programming')
  programming.books.create!(title: 'Pragmatic Programmer', rating: 5)
end

if Book.where(name: 'Ender\'s Game').nil?
  science_fiction = Genre.where(name: 'Science Fiction')
  science_fiction.books.create!(title: 'Ender\'s Game', rating: 5)
end
