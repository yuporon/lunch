class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recruit

  def create
    @favorite = current_user.favorites.create(recruit_id: params[:id])
    redirect_to request.referer
  end

  def destroy
    @favorite = current_user.favorites.find_by(recruit_id: params[:id]).destroy
    redirect_to request.referer
  end

  private

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end
end
