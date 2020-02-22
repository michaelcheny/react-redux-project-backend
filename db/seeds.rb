# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

m.user_projects.create(project: p)
d.user_projects.create(project: p)


