# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# categories = [automotive, charity, educational, makers_and_crafting, health_and_fitness, food_and_drink, programming, social_media, others]

# categories.each {|category| Category.create(name: category) }

advertisement = Category.create(name: 'Advertisement')
automotive = Category.create(name: 'Automotive')
charity = Category.create(name: 'Charity')
educational = Category.create(name: 'Educational')
farming = Category.create(name: 'Farming and Gardening')
fashion = Category.create(name: 'Fashion')
food_and_drink = Category.create(name: 'Food and Drink')
gaming = Category.create(name: 'Gaming')
health_and_fitness = Category.create(name: 'Health and Fitness')
home_improvement = Category.create(name: 'Home Improvement')
makers_and_crafting = Category.create(name: 'Makers and Crafting')
politics = Category.create(name: 'Politics')
programming = Category.create(name: 'Programming')
social_media = Category.create(name: 'Social Media')
others = Category.create(name: 'Others')


m = User.create(
  name: "michael", 
  email: "michael@michael.com", 
  password: "password", 
  password_confirmation: "password",
  city: "San Francisco",
  state: "CA",
  country: "US"
  )

d = User.create(
  name: "dog", 
  email: "dog@dog.com", 
  password: "password", 
  password_confirmation: "password",
  city: "San Francisco",
  state: "CA",
  country: "US"
  )  

p = Project.create(
  name: "Money Management App",
  description: "An app to manage your money. Track spending, income, etc. YEEEEET!",
  online: true,
  team_size: 5,
  owner_id: 1
)

programming.projects << p

m.user_projects.create(project: p)
d.user_projects.create(project: p)



