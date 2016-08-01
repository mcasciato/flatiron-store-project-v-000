class User < ActiveRecord::Base
  has_many :carts
  has_many :items, through: :carts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :current_cart, class_name: "Cart", foreign_key: "cart_id"
end
