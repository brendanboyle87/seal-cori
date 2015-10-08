class Record < ActiveRecord::Base
  belongs_to :user

  validates :crime_name, presence: true
  validates :convicted, inclusion:{ in: [true, false] }
  validates :felony, inclusion:{ in: [true, false] }, allow_nil: true
  validates :misdemeanor, inclusion:{ in: [true, false] }, allow_nil: true

  validates :user, presence: true
  validates :date, date: true
end
