class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy
  belongs_to :category

  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 8 }
end
