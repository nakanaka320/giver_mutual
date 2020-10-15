class Task < ApplicationRecord
  belongs_to :member
  belongs_to :room

  enum kind: {individual: 0, work: 1, others: 2}

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :time_required

  # scope :incoming, -> { where('start_at > ?', Time.zone.now).find(current_member.tasks.ids) }

  def update_finished_true
    self.finished = true if self.finished == false
    self.save
  end
end