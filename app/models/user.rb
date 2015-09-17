class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :recoverable,  :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable
end
