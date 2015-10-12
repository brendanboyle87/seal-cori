require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should validate_presence_of :crime_name }
  it { should validate_presence_of :user }
  it { should validate_presence_of :disposition_date }
  it { should belong_to(:user) }
end
