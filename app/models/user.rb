# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :comments
  has_many :reactions

  has_secure_password
  
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 8..20 }

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    binding.pry
    where(email: auth.info.email).first_or_initialize do |user|
      user.email = auth.info.email
      random_password = RandomPasswordGenerator.generate(20)
      user.password = random_password
      user.password_confirmation = random_password
    end
  end
end
