class CampComment < ApplicationRecord

    belongs_to :user
    belongs_to :camp

    validates :comment, presence: true
end
