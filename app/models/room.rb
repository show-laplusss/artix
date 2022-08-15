class Room < ApplicationRecord
    has_many :entry_rooms, dependent: :destroy
    has_many :messages, dependent: :destroy
end
