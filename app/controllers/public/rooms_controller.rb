class Public::RoomsController < ApplicationController
    before_action :authenticate_user!
    def create
        room = Room.new
        current = EntryRoom.new(user_id: current_user.id, room_id: room.id)
        another = EntryRoom.new(user_id: params[:entry][:user_id], room_id: room.id)
        redirect_to room_path(room)
    end
    def index
        current = current_user.EntryRoom
        my_room_id = []
        current.each do |entryroom|
            my_room_id << entryroom.room.id
        end
    end
end
