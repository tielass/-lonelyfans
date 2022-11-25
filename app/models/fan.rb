class Fan < ApplicationRecord

  NATIONS = ['Qatar', 'Ecuador', 'Senegal', 'Netherlands', 'Spain', 'Costa Rica', 'Germany', 'Japan', 'England', 'Iran', 'USA', 'Wales', 'Belgium', 'Canada', 'Morocco', 'Croatia', 'Argentina', 'Saudi Arabia', 'Mexico', 'Poland', 'Brazil', 'Serbia', 'Switzerland', 'Cameroon', 'France', 'Australia', 'Denmark', 'Tunisia', 'Portugal', 'Ghana', 'Uruguay', 'South Korea']
  CATEGORY = ['Supportive', 'Violent', 'Loud', 'Serious', 'Calm', 'Well behaved', 'Drunk', 'Settled']
  has_one_attached :photo
  validates_numericality_of :price, :greater_than => 0
  validates :nationality, inclusion: { in: NATIONS }
  validates :category, inclusion: { in: CATEGORY }
  validates :photo, :name, :price, presence: true
  # validates :description, length: { in: 8..300 }
  # validates :name, uniqueness: true
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_something,
  against: [:name, :description, :address, :nationality, :category],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
