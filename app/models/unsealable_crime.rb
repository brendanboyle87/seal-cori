class UnsealableCrime < ActiveRecord::Base
  include PgSearch
  validates :offense_name, presence: true, uniqueness: true

  pg_search_scope :search_by_offense, against: :offense_name
end
