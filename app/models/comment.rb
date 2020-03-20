class Comment < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy
end
