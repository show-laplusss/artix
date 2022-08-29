class Public::IllustsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def new
    @illust = Illust.new
  end

  def create
    @illust = Illust.new(illust_params)
    @illust.user_id = current_user.id
    if @illust.save
      flash[:notice] = 'Illust was successfully created.'
      redirect_to public_illust_path(@illust.id)
    else
      @illusts = Illust.all
      @user = current_user
      render :index
    end
  end

  def index
    @illusts = Illust.all
    @user = current_user
  end

  def show
    @illust = Illust.find(params[:id])
    @user = @illust.user
  end

  def edit
    @illust = Illust.find(params[:id])
    if @illust.user_id == current_user.id
      render "edit"
    else
      redirect_to illusts_path
    end
  end
  
  def update
    @illust = Illust.find(params[:id])
   if @illust.update(illust_params)
    flash[:notice] = 'Illust was successfully updated.'
    redirect_to public_illust_path(@illust.id) 
   else
    render :edit
   end
  end
  
  def destroy
    @illust = Illust.find(params[:id])
    @illust.destroy
    redirect_to public_illusts_path
  end
  
  private

  def illust_params
    params.require(:illust).permit(:title, :detail, :image)
  end
  
end
