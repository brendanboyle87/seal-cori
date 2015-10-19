require 'rails_helper'

RSpec.describe UnsealableCrime, type: :model do
  it { should validate_presence_of :offense_name }
  it { should validate_uniqueness_of :offense_name }
end
