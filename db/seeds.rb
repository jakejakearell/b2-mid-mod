# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mike = Mechanic.create!(name: "mike", years_of_experience: 10)
fred = Mechanic.create!(name: "fred", years_of_experience: 2)
doug = Mechanic.create!(name: "doug", years_of_experience: 12)

fast_furious = Ride.create!(name: "fast and furious", thrill_rating: 10, open: false)
small_world = Ride.create!(name: "small world", thrill_rating: 10, open: false)
death_drop = Ride.create!(name: "death drop", thrill_rating: 10, open: false)

RideMechanic.create!(ride: fast_furious, mechanic: mike)
RideMechanic.create!(ride: small_world, mechanic: fred)
RideMechanic.create!(ride: death_drop, mechanic: doug)
