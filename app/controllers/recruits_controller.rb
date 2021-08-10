class RecruitsController < ApplicationController
  before_action :set_recruit, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  def index
    @recruits = Recruit.all
  end
  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.create(reqruite_params)
    redirect_to @recruit
  end

  def show
    @recruit = recruit.find(params[:id])
  end

  def edit
    @recruit = recruit.find(params[:id]) 
  end

  def update
    @recruit = recruit.find(params[:id])
    @recruit.update(reqruite_params)
    redirect_to @recruit
  end

  private

  def recruit_params
    params.require(:recruit).permit(:shop, :location, :content, :status, :user_id, :icon)
  end

  def set_recruit
    @recruit = Recruit.find(params[:id])
    if @recruit.user != current_user
      redirect_to root_path
    end
  end
end
