require 'rails_helper'

RSpec.describe PersonalInformation, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:hometown) }
  it { should validate_presence_of(:father_name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:date_of_birth) }

  it { should validate_length_of(:zip).is_equal_to(6) }
  it { should validate_numericality_of(:zip).only_integer }
  it { should validate_inclusion_of(:state). in_array(StatesHelper::US_STATES) }
end
