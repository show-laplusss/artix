class Public::DirectMessageController < ApplicationController
  before_action :authenticate_user!, :only => [:create]
  def new
  end
  def create
    if EntryRoom.where(:user_id => current_user.id, :room_id => params[:room_id]).present?
      @message = DirectMessage.create!(params.permit(:user_id, :message, :room_id).merge(:user_id => current_user.id))
      room = Room.find(params[:room_id])
      redirect_to public_room_path(room)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
  end

  def index
  end

  def edit
  end
end
