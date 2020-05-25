# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :comments
  has_many :reactions

  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }

end
