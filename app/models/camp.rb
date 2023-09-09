class Camp < ApplicationRecord
  belongs_to :user
  has_many :camp_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @camp = Camp.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @camp = Camp.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @camp = Camp.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @camp = Camp.where("title LIKE?","%#{word}%")
    else
      @camp = Camp.all
    end
  end
end
