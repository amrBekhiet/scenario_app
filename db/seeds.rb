# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

var_description = "The film is based on the 1986 novel by Winston Groom. Both center on the character of Forrest Gump. However, the film primarily focuses on the first eleven chapters of the novel, before skipping ahead to the end of the novel with the founding of Bubba Gump Shrimp Co. and the meeting with Forrest, Jr. In addition to skipping some parts of the novel, the film adds several aspects to Gump's life that do not occur in the novel, such as his needing leg braces as a child and his run across the United States"

movie = Movie.create(name: 'Forrest Gump', image: 'https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg',description: "#{var_description}",scenario: '~/Desktop/forrest_gump_scenario') 
