class Public::UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
  def new
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @current = EntryRoom.where(user_id: current_user.id)
    @another = EntryRoom.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current.each do |current|
        @another.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = EntryRoom.new
      end
    end
  end

  def edit
  end
end
