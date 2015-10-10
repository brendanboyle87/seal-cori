require 'rails_helper'

feature 'user makes it to eligibility form', %{
  As a signed in User, with his CORI report who is not a registrered
  sex-offender I want to find out if I can seal my records.
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

    fill_in 'Name of Crime', with: "Simple Assault"
    choose('convicted_yes')
    choose('incarcerated_yes')
    fill_in 'datepicker', with: "08/08/2013"

    find("#eligibility-submit").trigger('click')
    expect(page).to have_content "Simple Assault is not eligible to be sealed at this time"
  end


  scenario 'user is not eligible due to disposition date of felony conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')
    choose('convicted_yes')
    choose('incarcerated_yes')
    fill_in 'datepicker', with: "08/08/2007"

    find("#eligibility-submit").trigger('click')
    expect(page).to have_content "Aggravated Assault is not eligible to be sealed at this time"
  end

  scenario 'user is not eligible due to disposition date of felony without conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')

    fill_in 'datepicker', with: "08/08/2007"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "Do you have another crime on your CORI report?"
  end

  scenario 'user is not eligible due to disposition date of felony without conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')

    fill_in 'datepicker', with: "08/08/2007"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "Do you have another crime on your CORI report?"
  end
end
