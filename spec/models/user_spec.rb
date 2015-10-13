require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should have_many(:records) }
  it { should have_many(:personal_informations) }
  it { should validate_acceptance_of(:terms_of_service) }
end
