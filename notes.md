LFG Collab

# User

has_many :user_projects
has_many :projects, through: :user_projcts
:name, :email, :password, :location

# User_Project

belongs_to :user
belongs_to :project

# Project

has_many :user_projects
has_many :users, through: :user_projects
has_many :comments as commentable
has_many :reactions as reactable
:name, :description

# Comments

belongs_to :user
belongs_to :commentable, polymorphic: true
has_many :comments, as: commentable
has_many :reactions, as: :reactable
:content

task belongs_to :user, optional: true
task belongs_to :project
project has_many :tasks
