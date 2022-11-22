class Booking < ApplicationRecord
  validates :start_date, presence: true
  # validates :status, inclusion: { in: ["x", "y"] }
  belongs_to :user
  belongs_to :fan
end
