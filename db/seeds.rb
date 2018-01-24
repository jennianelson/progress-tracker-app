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

Section.create(title: "Reading Literature")
Section.create(title: "Reading Informational Text")
Section.create(title: "Writing")
Section.create(title: "Speaking & Listening")
Section.create(title: "Language")

Standard.create(description: "Cite several pieces of textual evidence to support analysis of what the text says explicitly as well as inferences drawn from the text.", dot_notation: "CCSS.ELA-LITERACY.RL.7.1", subheading: "Key Ideas and Details")

Standard.create(description: "Cite several pieces of textual evidence to support analysis of what the text says explicitly as well as inferences drawn from the text.", dot_notation: "CCSS.ELA-LITERACY.RI.7.1", subheading: "Key Ideas and Details")

