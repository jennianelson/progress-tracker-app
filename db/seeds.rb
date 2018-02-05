# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "user1", email: "user1@email.com", password: "user1password")

Subject.create([{ title: "Math7", set_id: "B838B98D043045748F3814B9E43CAC85_D2504960_grade-07" }, { title: "English7", set_id: "B838B98D043045748F3814B9E43CAC85_D2505664_grade-07" }, { title: "Math8", set_id: "B838B98D043045748F3814B9E43CAC85_D2504960_grade-08" }, { title: "English8", set_id: "B838B98D043045748F3814B9E43CAC85_D2505664_grade-08" }])

eng7 = Subject.find_by(title: "English7")
eng7.sections.create([{ title: "Reading Literature", abbreviation: "RL"}, {title: "Reading Informational Text", abbreviation: "RI"}, {title: "Writing", abbreviation: "W"}, {title: "Speaking & Listening", abbreviation: "SL"}, {title: "Language", abbreviation: "L"}])

eng8 = Subject.find_by(title: "English8")
eng8.sections.create([{ title: "Reading Literature", abbreviation: "RL"}, {title: "Reading Informational Text", abbreviation: "RI"}, {title: "Writing", abbreviation: "W"}, {title: "Speaking & Listening", abbreviation: "SL"}, {title: "Language", abbreviation: "L"}])

math7 = Subject.find_by(title: "Math7")
math7.sections.create([{ title: "Ratios & Proportional Relationships", abbreviation: "RP"}, {title: "The Number System", abbreviation: "NS"}, {title: "Expressions & Equations", abbreviation: "EE"}, {title: "Geometry", abbreviation: "G"}, {title: "Statistics & Probability", abbreviation: "SP"}])

math8 = Subject.find_by(title: "Math8")
math8.sections.create([{ title: "Functions", abbreviation: "F"}, {title: "The Number System", abbreviation: "NS"}, {title: "Expressions & Equations", abbreviation: "EE"}, {title: "Geometry", abbreviation: "G"}, {title: "Statistics & Probability", abbreviation: "SP"}])