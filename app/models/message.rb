class Message < ApplicationRecord
  belongs_to :member
  belongs_to :room

  validates :content, presence: true
end