class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buyers, foreign_key: :buyer_id , class_name: "Transaction"
  has_many :sellers, through: :buyers
  has_many :sellers, foreign_key: :seller_id, class_name: "Transaction"
  has_many :buyers, through: :sellers
end
