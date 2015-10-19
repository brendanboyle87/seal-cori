require "rails_helper"

RSpec.describe PetitionGenerator do
  let!(:personal_info) { FactoryGirl.create(:personal_information) }
  let (:user) { personal_info.user }
  let (:pdfmaker) { PetitionGenerator.new(personal_info) }

  describe ".new" do
    it "takes a persoanl_information object as an argument" do
      expect(pdfmaker).to be(PetitionGenerator)
    end
  end
end
