class User < ApplicationRecord

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,:registerable, :recoverable, :rememberable,
  devise :database_authenticatable, :validatable
end
