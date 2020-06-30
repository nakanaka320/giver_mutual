class Room < ApplicationRecord
  has_many :members,dependent: :destroy
  has_many :tasks,dependent: :destroy
  has_many :comments,dependent: :destroy
end