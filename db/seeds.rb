# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'ffaker'

10.times.map do 
  project = Project.new(
    title: FFaker::Lorem.words(3).join(' '),
    tags: 5.times.map { FFaker::Lorem.characters(5) },
    description: FFaker::Lorem.words(200).join(' '),
    source: FFaker::Lorem.characters(20),
    live: FFaker::Lorem.characters(20),
    demo: 'https://www.youtube.com/embed/dQw4w9WgXcQ',
  )
  
  project.images.attach(io: File.open('storage/images/desktop.png'), filename: 'desktop.png', content_type: 'png')
  project.images.attach(io: File.open('storage/images/mobile.jpg'), filename: 'mobile.jpg', content_type: 'jpg')
  
  project.save!
end
