class Task < ApplicationRecord
  belongs_to :member
  belongs_to :room,dependent: :destroy
  has_many :comments,dependent: :destroy
end
