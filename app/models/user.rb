class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable      

  has_many :buyers, foreign_key: :buyer_id , class_name: "Product"
  has_many :sellers, through: :buyers
  has_many :sellers, foreign_key: :seller_id, class_name: "Product"
  has_many :buyers, through: :sellers
  # how to reciprocate relationship between products?  Users don't know about products.

  def sold_products
    Product.where("seller_id = #{self.id}")
  end

  def bought_products
    Product.where("buyer_id = #{self.id}")
  end

  def username
    self.email.split("@")[0]
  end

  # def self.from_omniauth(auth)
  #   # Either create a User record or update it based on the provider (Google) and the UID   
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.token = auth.credentials.token
  #     user.expires = auth.credentials.expires
  #     user.expires_at = auth.credentials.expires_at
  #     user.refresh_token = auth.credentials.refresh_token
  #   end
  # end
end
