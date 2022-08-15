class Public::UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @current_entry = EntryRoom.where(user_id: current_user.id)
    @another = EntryRoom.where(user_id: @user_id)
  end

  def edit
  end
end
