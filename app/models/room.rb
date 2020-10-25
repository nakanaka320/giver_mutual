class Room < ApplicationRecord
  has_many :members,dependent: :destroy
  has_many :tasks
  has_many :comments,dependent: :destroy
  has_many :messages
end