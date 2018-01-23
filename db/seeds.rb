# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "user1", email: "user1@email.com", password: "user1password")

Subject.create([{ title: "Math", grade: "7" }, { title: "English", grade: "7" }, { title: "Civics", grade: "7" }, { title: "Science", grade: "7" }])
Subject.create([{ title: "Math", grade: "8" }, { title: "English", grade: "8" }, { title: "World History", grade: "8" }, { title: "Science", grade: "8" }])
Subject.create([{ title: "Math", grade: "9" }, { title: "English", grade: "9" }, { title: "US History", grade: "9" }, { title: "Science", grade: "9" }])