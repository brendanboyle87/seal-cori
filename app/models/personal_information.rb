class PersonalInformation < ActiveRecord::Base
  belongs_to :user

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: { in: StatesHelper::US_STATES }
  validates :hometown, presence: true
  validates :father_name, presence: true
  validates :user, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }
  validates :zip, length: { is: 5 }
  validates :date_of_birth, presence: true, date: true
end
