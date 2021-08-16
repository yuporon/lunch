class Recruit < ApplicationRecord
  has_one_attached :icon
  belongs_to :user

  enum status:{
    wanted: 0, #募集中
    full: 1, #満員
    done: 2 #募集終了
  }

  paginates_per 4
  scope :index_all, -> {
    select(:id, :shop, :location, :content, :status, :user_id)
    .order(created_at: :asc)
    .includes(:user)
  }
end
