class User < ActiveRecord::Base
  has_secure_password
  has_many :boards
  has_many :likes
  has_many :comments
end
