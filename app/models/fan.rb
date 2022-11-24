class Fan < ApplicationRecord
  NATIONS = ['qatar', 'ecuador', 'senegal', 'netherlands', 'spain', 'costa rica', 'germany', 'japan', 'england', 'iran', 'us', 'wales', 'belgium', 'canada', 'morocco', 'coratia', 'argentinia', 'saudi arabia', 'mexico', 'poland', 'brazil', 'serbia', 'switzerland', 'cameroon', 'france', 'australia', 'denmark', 'tunisia', 'portugal', 'ghana', 'uruguay', 'south korea']
  CATEGORY = ['supportive', 'violent', 'loud', 'serious', 'settled', 'good behaviour', 'drunk']

  # validates :nationality, inclusion: { in: NATIONS }
  # validates :category, inclusion: { in: CATEGORY }
  # validates :image_url, :name, :price, presence: true
  # validates :description, length: { in: 8..300 }
  validates :name, uniqueness: true
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
