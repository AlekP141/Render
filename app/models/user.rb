class User < ApplicationRecord
  has_many :artworks
  has_many :reviews # added reviews(not sure if needed)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
