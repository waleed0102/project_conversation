class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :status_histories, dependent: :destroy

  enum status: { not_started: 0, in_progress: 1, on_hold: 2, completed: 3, cancelled: 4 }

  validates :status, presence: true, inclusion: { in: statuses.keys }
end
