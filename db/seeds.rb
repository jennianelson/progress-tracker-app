# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "user1", email: "user1@email.com", password: "user1password")

Subject.create([{ title: "Math7" }, { title: "English7" }, { title: "Math8" }, { title: "English8" }, { title: "Math9" }, { title: "English9" }])

eng7 = Subject.find_by(title: "English7")

eng7.sections.create([{ title: "Reading Literature"}, {title: "Reading Informational Text"}, {title: "Writing"}, {title: "Speaking & Listening"}, {title: "Language"}])

# math7.sections.create([{ title: "Ratios & Proportional Relationships"}, {title: "The Number System"}, {title: "Expressions & Equations"}, {title: "Geometry"}, {title: "Statistics & Probability"}])