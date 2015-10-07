class User < ActiveRecord::Base
  belongs_to :user

  validates :crime_name, presence: true
  validates :user, presence: true

  validates :date, date: true
end
