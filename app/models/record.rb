class Record < ActiveRecord::Base
  belongs_to :user

  validates :crime_name, presence: true
  validates :convicted, inclusion: { in: [true, false] }
  validates :felony, inclusion: { in: [true, false] },
                     allow_nil: true
  validates :misdemeanor, inclusion: { in: [true, false] },
                          allow_nil: true

  validates :user, presence: true
  validates :disposition_date, date: true, presence: true

  def eligible?
    if self.misdemeanor? && (self.disposition_date > (DateTime.now - 5.years)) && !self.banned?
      false
    elsif self.felony? && (self.disposition_date > (DateTime.now - 10.years)) && !self.banned?
      false
    else
      true
    end
  end

  def banned?
    search = UnsealableCrime.search_by_offense(self.crime_name)
    if !search.empty? && self.convicted?
      true
    else
      false
    end
  end
end
