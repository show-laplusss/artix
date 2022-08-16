class Public::FavoritesController < ApplicationController
    
    def create
        illust = Illust.find(params[:illust_id])
        favorite = current_user.new(illust_id: illust.id)
        favorite.save
        redirect_to illust_path(illust)
    end
    
    def destroy
        illust = Illust.find(params[:illust_id])
        favorite = current_user.favorites.find_by(illust_id: illust.id)
        favorite.destroy
        redirect_to illust_path(illust)
    end
    
end
