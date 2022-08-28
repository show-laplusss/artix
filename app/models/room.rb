class Room < ApplicationRecord
    has_many :entry_rooms, dependent: :destroy
    has_many :direct_messages, dependent: :destroy
end
