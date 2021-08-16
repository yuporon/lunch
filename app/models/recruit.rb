class Recruit < ApplicationRecord
  has_one_attached :icon
  belongs_to :user

  paginates_per 4
  scope :index_all, -> {
    select(:id, :shop, :location, :content, :status, :user_id)
    .order(created_at: :asc)
    .includes(:user)
  }
end
