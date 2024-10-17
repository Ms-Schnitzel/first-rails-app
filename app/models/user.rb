class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: false
  validates :first_name, presence: false
  validates :last_name, presence: false

  has_many :posts
end
