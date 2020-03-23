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
  name: "Michael", 
  email: "michael@michael.com", 
  password: "password", 
  password_confirmation: "password",
  city: "San Francisco",
  state: "CA",
  country: "US"
  )

d = User.create(
  name: "Dog", 
  email: "dog@dog.com", 
  password: "password", 
  password_confirmation: "password",
  city: "San Francisco",
  state: "CA",
  country: "US"
  )  

peter = User.create(
  name: "Peter Griffin", 
  email: "peter@family.com", 
  password: "password", 
  password_confirmation: "password",
  city: "Quahog",
  state: "Rhode Island",
  country: "US"
  ) 

r = User.create(
  name: "Rick Sanchez", 
  email: "rick@sanchez.com", 
  password: "password", 
  password_confirmation: "password",
  city: "C-137",
  state: "Earth",
  country: "Earth"
  )   

morty = User.create(
  name: "Morty Smith", 
  email: "morty@smith.com", 
  password: "password", 
  password_confirmation: "password",
  city: "C-137",
  state: "Earth",
  country: "Earth"
  ) 

kid = User.create(
  name: "Charlie Brown", 
  email: "charlie@brown.com", 
  password: "password", 
  password_confirmation: "password",
  city: "Minneapolis",
  state: "IN",
  country: "US"
  )  
  
p1 = Project.create(
  name: "Money Management App",
  description: "Hi, I am looking for people to help me on creating a money management app. This app will be aimed towards people who want to simplify their lives by managing money without thinking too much about it. The goal is to push this app out on web and mobile at the same time, preferably using React Native. Join and we can set up meet up zoom meet up times.",
  online: true,
  team_size: 5,
  owner_id: 1
)
p2 = Project.create(
  name: "Weekly Group Fitness Classes",
  description: "I am hosting a weekly group fitness class every Sunday afternoon. Each class will have a different workout to get the most out of it. There is no minimum fitness level required, everyone of all shapes and sizes can join and get fit together. Bring a bottle of water, comfortable shoes and some socks to change out of! Keep checking the comments to find out where we meet.",
  online: false,
  team_size: 10,
  owner_id: 3
)

p3 = Project.create(
  name: "Bank Heist",
  description: "I NEED TO ASSEMBLE THE CREW. I NEED ONE 3-EYED ALIEN PIANIST, ONE VAMPIRE MONSTER TRUCK DRIVER, AND ONE MULTI-HANDED COW GIRL. THERE IS THIS HEIST-CON EVENT HAPPENING AND WE NEED A CREW TO PARTICIPATE. THE REWARD IS THE CRYSTAL SKULL OF HORWITZ, WE GO IN, GRAB IT, AND PROFIT!!!!!! P.S. THIS MISSION IS DANGEROUS AND YOU MAY DIE. THIS MISSION IS NOT FOR THE WEAK!!!",
  online: false,
  team_size: 4,
  owner_id: 4
)

p4 = Project.create(
  name: "Massive Snowball Fight",
  description: "Calling for all people in the state of Indiana to come together the night before Thanksgiving to have a massive snowball fight. The rules are 1. Only throwing snow 2. Follow rule #1. Join now so we can pick teams and location.",
  online: false,
  team_size: 10,
  owner_id: 6
)

p5 = Project.create(
  name: "Love Finderzz App",
  description: "Hey wanna build an app? I have this genius plan to build this speed dating app. Users will magically fall in love with their dates then get new dates and fall in love with them. This will make us rich! We can brainwash them! Muhahahaa.",
  online: true,
  team_size: 3,
  owner_id: 5
)




programming.projects << p1
programming.projects << p5
health_and_fitness.projects << p2
others.projects << p3
others.projects << p4

m.user_projects.create(project: p1)
d.user_projects.create(project: p1)
peter.user_projects.create(project: p2)
r.user_projects.create(project: p3)
kid.user_projects.create(project: p4)
morty.user_projects.create(project: p5)


