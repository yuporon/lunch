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
    @recruit = Recruit.create(recruit_params)
    @recruit.user_id = current_user.id
    @recruit.save
    redirect_to recruits_path
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  def edit
  end

  def update
    @recruit.update(recruit_params)
    redirect_to recruits_path
  end

  def destroy
    if @recruit.destroy
      redirect_to recruits_path
    else
      render :index
    end
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
