class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zip, numericality: { only_integer: true }, allow_nil: true
  validates :social_security, numericality: { only_integer: true }, allow_nil: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
