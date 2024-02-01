class Camera < ApplicationRecord
  belongs_to :user
  CATEGORIES = ['DSLR', 'Mirrorless', 'Bridge', 'Compact', 'Action', 'Instant', '360 Cameras']
end
