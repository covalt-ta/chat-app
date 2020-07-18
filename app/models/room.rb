class Room < ApplicationRecord
  has_many :users, through: :room_user
  has_many :room_users
end
