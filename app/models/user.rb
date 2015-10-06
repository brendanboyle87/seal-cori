class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :terms_of_service, acceptance: true
  validates :zip, numericality: { only_integer: true }, allow_nil: true
  validates :social_security, numericality: { only_integer: true }, allow_nil: true
  validates :zip, length: {is: 6}, allow_nil: true
  validates :social_security, length: {is: 9}, allow_nil: true
  validates :state, inclusion: { in: StatesHelper::US_STATES }, allow_nil: true
  validates :date_of_birth, date: true, allow_nil: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
