class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :room
  belongs_to :task
end
