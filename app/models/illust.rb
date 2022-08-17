class Illust < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :illust_tags, dependent: :destroy
    has_many :tags, through: :illust_tags,dependent: :destroy
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
    
end
