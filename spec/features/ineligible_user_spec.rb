require 'rails_helper'

feature 'user makes determines eligibility', %{
  As a signed in User, I want to find out if I can seal my records.
} do
  # Acceptance Criteria:
  # * User must be signed in to see the eligibility form
  #  If the user does not have their CORI, they are instructed how to obtain it.
  scenario 'user does not input required fields', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    find("#eligibility-submit").trigger('click')

    expect(page).to have_content("Disposition date can't be blank")
    expect(page).to have_content("Crime name can't be blank")
    expect(page).to have_content("Disposition date is not a date")
  end

  scenario 'user is not eligible due to disposition date of misdemeanor conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime:', with: "Simple Assault"
    choose('convicted_yes')
    choose('incarcerated_yes')
    fill_in 'record-date', with: "08/08/2013"

    find("#eligibility-submit").trigger('click')
    expect(page).to have_content "Simple Assault is not eligible to be sealed at this time"
  end


  scenario 'user is not eligible due to disposition date of felony conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime:', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')
    choose('convicted_yes')
    choose('incarcerated_yes')
    fill_in 'record-date', with: "08/08/2007"

    find("#eligibility-submit").trigger('click')
    expect(page).to have_content "Aggravated Assault is not eligible to be sealed at this time"
  end

  scenario 'user is not eligible due to disposition date of felony without conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime:', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')

    fill_in 'record-date', with: "08/08/2007"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "This crime is not eligible to be sealed yet."
    expect(page).to have_content "Do you have another crime on your CORI report?"
  end

  scenario 'user is not eligible due to disposition date of misdemeanor without conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime:', with: "Simple Assault"
    choose('felony_or_misdemeanor_misdemeanor')

    fill_in 'record-date', with: "08/08/2012"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "This crime is not eligible to be sealed yet."
    expect(page).to have_content "Do you have another crime on your CORI report?"
  end

  scenario 'user is not eligible due to an unseable crime', js: true do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:unsealable_crime)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Unlicensed Sale of Ammunition"
    choose('felony_or_misdemeanor_misdemeanor')
    choose('convicted_yes')
    choose('incarcerated_yes')

    fill_in 'record-date', with: "08/08/2009"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "A Unlicensed Sale of Ammunition conviction cannot be sealed in Massachusetts."
  end
end
