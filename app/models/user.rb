class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  
  has_many :illusts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower
  
  has_many :entry_rooms, dependent: :destroy
  has_many :direct_messages, dependent: :destroy
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :user_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  
  has_one_attached :profile_image
  def get_profile_image(width,height)
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
