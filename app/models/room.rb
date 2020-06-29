class Room < ApplicationRecord
  belongs_to :member
  has_many :tasks,dependent: :destroy
  has_many :comments,dependent: :destroy
end