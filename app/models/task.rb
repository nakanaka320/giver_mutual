class Task < ApplicationRecord
  belongs_to :member
  belongs_to :room

  enum kind: {individual: 0, work: 1, others: 2}

  def update_finished_true
    self.finished = true if self.finished == false
    self.save
  end
end