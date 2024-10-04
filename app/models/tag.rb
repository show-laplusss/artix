class Tag < ApplicationRecord
    has_many :illust_tags, dependent: :destroy
    has_many :illusts, through: :illust_tags, dependent: :destroy
end