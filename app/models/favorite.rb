class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :camp

  validates_uniqueness_of :camp_id, scope: :user_id
end
