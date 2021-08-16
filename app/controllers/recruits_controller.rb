class RecruitsController < ApplicationController
  before_action :set_recruit, only: %i[ assign edit update destroy ]
  before_action :timepass
  before_action :authenticate_user!

  def index
    @recruits = Recruit.index_all.page(params[:page])
  end

  def my_lunch
    @recruits = Recruit.where(owner_id: current_user).page(params[:page])
  end

  def assign
  end
  
  def new
    @recruit = Recruit.new
  end

  def create
    @recruit = Recruit.create(recruit_params)
    @recruit.owner_id = current_user.id
    if @recruit.save
      redirect_to @recruit
    else
      render :new
    end
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  def edit
  end

  def update
    if @recruit.update(recruit_params)
      redirect_to @recruit
    else
      render :show
    end
  end

  def destroy
    if @recruit.destroy
      redirect_to recruits_url
    else
      render :index
    end
  end

  def timepass
    time = Time.now
    recruits = Recruit.all
    recruits.each do |recruit|
      if recruit.end_on < time
        recruit.status = 2
        recruit.save
      end
    end 
  end

  private

  def recruit_params
    params.require(:recruit).permit(:shop, :location, :content, :status, :owner_id, :assigne_id, :icon, :end_on)
  end

  def set_recruit
    @recruit = Recruit.find(params[:id])
    if @recruit.owner != current_user
      redirect_to recruits_url
    end
  end
end
