class StatusHistory < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum old_status: { not_started: 0, in_progress: 1, on_hold: 2, completed: 3, cancelled: 4 }, _prefix: :old
  enum new_status: { not_started: 0, in_progress: 1, on_hold: 2, completed: 3, cancelled: 4 }, _prefix: :new

  validates :old_status, :new_status, presence: true
end
