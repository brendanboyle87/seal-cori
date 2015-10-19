require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should validate_presence_of :crime_name }
  it { should validate_presence_of :user }
  it { should validate_presence_of :disposition_date }
  it { should belong_to(:user) }

  let!(:convicted_banned) {
    FactoryGirl.create(:record, convicted: true, crime_name: "Unlicensed Sale of Ammunition")  }
  let!(:no_conviction_banned) {
    FactoryGirl.create(:record, crime_name: "Unlicensed Sale of Ammunition") }
  let!(:not_banned) { FactoryGirl.create(:record) }
  let!(:unsealable) { FactoryGirl.create(:unsealable_crime) }

  describe "#banned" do
    it "returns true when offense unsealable and record convicted" do
      expect(convicted_banned.banned?).to be(true)
    end

    it "returns false when offense unsealable and record convicted" do
      expect(no_conviction_banned.banned?). to be(false)
    end

    it "returns false when the offense is sealable" do
      expect(not_banned.banned?).to be(false)
    end
  end

  let!(:misdemeanor_less_than_5) { FactoryGirl.create(:record, disposition_date: 4.years.ago ) }
  let!(:misdemeanor_more_than_5) { FactoryGirl.create(:record) }
  let!(:felony_less_than_10) { FactoryGirl.create(:record, misdemeanor: false, felony: true, disposition_date: 9.years.ago ) }
  let!(:felony_more_than_10) { FactoryGirl.create(:record, misdemeanor: false, felony: true, disposition_date: 11.years.ago ) }

  describe "#eligible" do
    it "returns false when misdemeanor disposition date is less than 5 years ago" do
      expect(misdemeanor_less_than_5.eligible?).to be(false)
    end

    it "returns false when felony disposition date is less than 10 years ago" do
      expect(felony_less_than_10.eligible?).to be(false)
    end

    it "returns true when misdemeanor disposition date is more than 5 years ago" do
      expect(misdemeanor_more_than_5.eligible?).to be(true)
    end

    it "returns true when felony disposition date is more than 10 years ago" do
      expect(felony_more_than_10.eligible?).to be(true)
    end
  end
end
