class Public::UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @current_entry = EntryLoom.where(user_id: current_user.id)
  end

  def edit
  end
end
