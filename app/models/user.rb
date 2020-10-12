class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :buyers, foreign_key: :buyer_id , class_name: "Product"
  has_many :sellers, through: :buyers
  has_many :sellers, foreign_key: :seller_id, class_name: "Product"
  has_many :buyers, through: :sellers

  def sold_products
    Product.where("seller_id = #{self.id}")
  end

  def bought_products
    Product.where("buyer_id = #{self.id}")
  end

  def username
    self.email.split("@")[0]
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
