require "rails_helper"

RSpec.describe PetitionGenerator do
  let!(:personal_info) { FactoryGirl.create(:personal_information) }
  let (:user) { personal_info.user }
  let (:pdfmaker) { PetitionGenerator.new(personal_info) }

  describe ".new" do
    it "takes a persoanl_information object as an argument" do
      expect(pdfmaker).to be_an(PetitionGenerator)
    end
  end

  describe "#personal_information" do
    it "has a reader for personal_information" do
      expect(pdfmaker.personal_information).to be_an(PersonalInformation)
    end

    it "does not have a writer for personal_information" do
      expect { pdfmaker.personal_information = "test" }.to raise_error(NoMethodError)
    end
  end

  describe "#pdftk" do
    it "has a reader for pdftk" do
      expect(pdfmaker.pdftk).to be_an(PdfForms::PdftkWrapper)
    end

    it "does not have a writer for pdftk" do
      expect { pdfmaker.pdftk = "test" }.to raise_error(NoMethodError)
    end
  end

  describe "#user" do
    it "has a reader for user" do
      expect(pdfmaker.user).to eq(personal_info.user)
    end

    it "#does not have a writer for user" do
      expect { pdfmaker.user = "test" }.to raise_error(NoMethodError)
    end
  end

  describe "#info_hash" do
    it "has a reader and writer for info_hash" do
      expect(pdfmaker.info_hash).to eq({})
      pdfmaker.info_hash[:test] = "test"
      expect(pdfmaker.info_hash[:test]).to eq("test")
    end
  end
end
