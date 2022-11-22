class Fan < ApplicationRecord
  belongs_to :user
  validates :image_url, presence: true
  validates :name, presence: true
end
