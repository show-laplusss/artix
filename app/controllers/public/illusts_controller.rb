class Public::IllustsController < ApplicationController
  def new
    @illust = Illust.new
  end
  
  def create
    @illust = Illust.new(illust_params)
    @illust.user_id = current_user.id
    if @illust.save
      flash[:notice] = 'Illust was successfully created.'
      redirect_to 
    else
      @illusts = Illust.all
      @user = current_user
      render :index
    end
  end

  def index
  end

  def show
    @illust = Illust.find(params[:id])
    @user = @illust.user
  end

  def edit
  end
end
