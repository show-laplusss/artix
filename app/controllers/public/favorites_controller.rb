class Public::FavoritesController < ApplicationController
    def create
        illust = Illust.find(params[:illust_id])
        favorite = current_user.favorites.new(illust_id: illust.id)
        favorite.save
        redirect_to public_illust_path(illust)
    end

    def destroy
        illust = Illust.find(params[:illust_id])
        favorite = current_user.favorites.find_by(illust_id: illust.id)
        favorite.destroy
        redirect_to public_illust_path(illust)
    end
end
