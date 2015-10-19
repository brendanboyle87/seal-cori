FactoryGirl.define do
  factory :personal_information do
    user
    middle_name "Joseph"
    address "241 Alvin St."
    city "Warwick"
    state "RI"
    zip "02886"
    date_of_birth "08/08/1987"
    hometown "Warwick, RI"
    father_name "Stephen Boyle"
    mother_maiden "Abraham"
  end
end
