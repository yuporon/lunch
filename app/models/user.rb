class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :owned_recruits,    class_name: "Recruit", foreign_key: "owner_id", dependent: :destroy
  has_many :assigned_recruits, class_name: "Recruit", foreign_key: "assigne_id"

  def assign(user_id)
    owned_recruits.create(assigne_id: user_id)
  end
  
  def withdraw(user_id)
    owned_recruits.find_by(assigne_id: user_id).destroy
  end

end
