class Public::RoomsController < ApplicationController
    before_action :authenticate_user!
    def create
        @room = Room.create
        @current = EntryRoom.create(user_id: current_user.id, room_id: @room.id)
        @another = EntryRoom.create(user_id: params[:user_id], room_id: @room.id)
        redirect_to public_room_path(@room)
    end
    def index
        current = current_user.EntryRoom
        my_room_id = []
        current.each do |entryroom|
            my_room_id << entryroom.room.id
        end
        @another = EntryRoom.where(room_id: my_room_id).where.not(user_id: current_user.id)
    end
    def show
        @room = Room.find(params[:id])
        @messages = @room.direct_messages
        @message = DirectMessage.new
        @entries = @room.entry_rooms
        @another = @entries.where.not(user_id: current_user.id).first
    end
    private
    
    
end
