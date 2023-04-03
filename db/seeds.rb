# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create!(title: "YouTube", color: "red")
Category.create!(title: "Programming", color: "blue")
Category.create!(title: "Free", color: "green")

100.times do |i|
  Video.create!(
    title: "Basic rspec Ruby on Rails model specs #{i}",
    description: "In this episode you'll learn some basics for testing simple methods on Ruby on Rails models. #{i}",
    url: 'https://www.youtube.com/watch?v=Spogv4o8haM',
    category_id: Random.rand(1..3)
  )
end
