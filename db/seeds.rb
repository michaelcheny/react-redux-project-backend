# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# categories = [automotive, charity, educational, makers_and_crafting, health_and_fitness, food_and_drink, programming, social_media, others]

# categories.each {|category| Category.create(name: category) }

automotive = Category.create(name: 'automotive')
charity = Category.create(name: 'charity')
educational = Category.create(name: 'educational')
makers_and_crafting = Category.create(name: 'makers_and_crafting')
health_and_fitness = Category.create(name: 'health_and_fitness')
food_and_drink = Category.create(name: 'food_and_drink')
programming = Category.create(name: 'programming')
social_media = Category.create(name: 'social_media')
others = Category.create(name: 'others')


m = User.create(
  name: "michael", 
  email: "michael@michael.com", 
  password: "password", 
  password_confirmation: "password"
  )

d = User.create(
  name: "dog", 
  email: "dog@dog.com", 
  password: "password", 
  password_confirmation: "password",
  )  

p = Project.create(
  name: "Money Management App",
  description: "An app to manage your money. Track spending, income, etc. YEEEEET!"
)

programming.projects << p

m.user_projects.create(project: p)
d.user_projects.create(project: p)



