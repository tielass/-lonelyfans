class Booking < ApplicationRecord
  validates :start_time, :end_time, presence: true
  belongs_to :user
  belongs_to :fan
end
