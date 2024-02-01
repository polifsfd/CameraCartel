class Camera < ApplicationRecord
  belongs_to :user
  # belongs_to :category
  has_many :bookings, dependent: :destroy

  CATEGORIES = ['DSLR', 'Mirrorless', 'Bridge', 'Compact', 'Action', 'Instant', '360 Cameras']

end
