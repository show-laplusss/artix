class Illust < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    belongs_to :user
    has_many :favorites, dependent: :destroy

    has_many :comments, dependent: :destroy
    has_many :illust_tags, dependent: :destroy
    has_many :tags, through: :illust_tags,dependent: :destroy

    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
    def get_image(width,height)
        image.variant(resize_to_limit: [width, height])
    end
end
