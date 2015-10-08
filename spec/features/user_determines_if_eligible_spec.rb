require 'rails_helper'

feature 'user makes it to eligibility form', %{
  As a signed in User, with his CORI report who is not a registrered
  sex-offender I want to find out if I can seal my records.
} do
  # Acceptance Criteria:
  # * User must be signed in to see the eligibility form
  #  If the user does not have their CORI, they are instructed how to obtain it.
  scenario 'user is not eligible due to disposition date of misdemeanor conviction', js: true do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button "Log in"

    choose 'yes_or_no_yes'
    click_on('Submit')

    choose 'yes_or_no_no'
    click_on('Submit')

    fill_in 'Name of Crime', with: "Simple Assault"
    choose('felony_or_misdemeanor_misdemeanor')
    choose('convicted_true')
    choose('incarcerated_yes')
    fill_in 'datepicker', with: "08/08/2013"


    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "Simple Assault is not eligible to be sealed at this time"
  end


  scenario 'user is not eligible due to disposition date of felony conviction', js: true do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button "Log in"

    choose 'yes_or_no_yes'
    click_on('Submit')

    choose 'yes_or_no_no'
    click_on('Submit')

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')
    choose('convicted_true')
    choose('incarcerated_yes')
    fill_in 'datepicker', with: "08/08/2007"


    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "Aggravated Assault is not eligible to be sealed at this time"
  end
end
