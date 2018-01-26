# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "user1", email: "user1@email.com", password: "user1password")

Subject.create([{ title: "Math7" }, { title: "English7" }, { title: "Civics7" }, { title: "Science7" }])
Subject.create([{ title: "Math8" }, { title: "English8" }, { title: "World History8" }, { title: "Science8" }])
Subject.create([{ title: "Math9" }, { title: "English9" }, { title: "US History9" }, { title: "Science9" }])

# eng7 = Subject.find_by(title: "English7")

# eng7.sections.create([{ title: "Reading Literature"}, {title: "Reading Informational Text"}, {title: "Writing"}, {title: "Speaking & Listening"}, {title: "Language"}])

# rl = Section.find_by(title: "Reading Literature")
# rl.standards.create(description: "Cite several pieces of textual evidence to support analysis of what the text says explicitly as well as inferences drawn from the text.", dot_notation: "CCSS.ELA-LITERACY.RL.7.1", subheading: "Key Ideas and Details")

# ri = Section.find_by(title: "Reading Informational Text")
# ri.standards.create(description: "Cite several pieces of textual evidence to support analysis of what the text says explicitly as well as inferences drawn from the text.", dot_notation: "CCSS.ELA-LITERACY.RI.7.1", subheading: "Key Ideas and Details")

# rl.standards.create(description: "Determine a theme or central idea of a text and analyze its development over the course of the text; provide an objective summary of the text.", dot_notation: "CCSS.ELA-LITERACY.RL.7.2", subheading: "Key Ideas and Details")
# rl.standards.create(description: "Analyze how particular elements of a story or drama interact (e.g., how setting shapes the characters or plot).", dot_notation: "CCSS.ELA-LITERACY.RL.7.3", subheading: "Key Ideas and Details")
# rl.standards.create(description: "Determine the meaning of words and phrases as they are used in a text, including figurative and connotative meanings; analyze the impact of rhymes and other repetitions of sounds (e.g., alliteration) on a specific verse or stanza of a poem or section of a story or drama.", dot_notation: "CCSS.ELA-LITERACY.RL.7.4", subheading: "Craft and Structure")