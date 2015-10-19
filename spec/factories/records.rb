FactoryGirl.define do
  factory :record do
    user
    crime_name 'Assault'
    misdemeanor true
    convicted   false
    disposition_date { 6.years.ago }
  end
end
