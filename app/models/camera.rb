class Camera < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  has_many :bookings, dependent: :destroy
  has_one_attached :picture

  CATEGORIES = ['DSLR', 'Mirrorless', 'Bridge', 'Compact', 'Action', 'Instant', '360 Cameras']

end
