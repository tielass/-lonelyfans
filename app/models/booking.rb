class Booking < ApplicationRecord
  # validates :start_date, presence: true
  belongs_to :user
  belongs_to :fan
end
