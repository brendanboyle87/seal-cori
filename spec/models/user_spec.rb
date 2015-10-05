require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_numericality_of :zip }
  it { should validate_numericality_of :social_security }
  it { should validate_length_of(:zip).is_equal_to(6) }
  it { should validate_length_of(:social_security).is_equal_to(9) }

  it do
    should validate_inclusion_of(:state). in_array StatesHelper::US_STATES
  end
end
