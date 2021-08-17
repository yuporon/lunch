class Recruit < ApplicationRecord
  has_one_attached :icon
  belongs_to :owner,    class_name: "User", foreign_key: "owner_id"
  belongs_to :assigne, class_name: "User", foreign_key: "assigne_id", optional: true
  has_many :favorites, dependent: :destroy

  enum status:{
    wanted: 0, #募集中
    full: 1, #満員
    done: 2 #募集終了
  }

  paginates_per 4
  scope :index_all, -> {
    select(:id, :shop, :location, :content, :status, :owner_id, :assigne_id, :end_on)
    .order(created_at: :asc)
    .includes(:owner)
  }
end
