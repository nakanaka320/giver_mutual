class Task < ApplicationRecord
  belongs_to :member
  belongs_to :room,dependent: :destroy
  has_many :comments,dependent: :destroy

  enum kind: {individual: 0, work: 1, others: 2}

  scope :incoming, -> { where('start_at > ?', Time.zone.now) }

  def update_finished_true
    self.finished = true if self.finished == false
    self.save
  end
end
