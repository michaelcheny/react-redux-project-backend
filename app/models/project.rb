class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy
  belongs_to :category
  
end
