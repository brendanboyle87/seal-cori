require 'rails_helper'

feature 'user is a registrered sex offender or has been one', %{
  As a signed in User, with his CORI report who is a registrered
  sex-offender (or has been one in the past 15 years) I want to find out
  the special steps I need to take to seal my records.
} do
  # Acceptance Criteria:
  # * User must be signed in to see the eligibility form
  #  If the user does not have their CORI, they are instructed how to obtain it.
  scenario 'user is not eligible due to disposition date of misdemeanor', js: true do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button "Log in"

    choose 'yes_or_no_yes'
    click_on('Submit')

    choose 'yes_or_no_no'
    click_on('Submit')

    fill_in 'Name', with: "Simple Assault"
    choose('Convcited', from: 'Disposition')
    choose 'incarcerated_yes'
    fill_in 'Date of Release', with: "08/08/2013"

    expect(page).to have_content "Simple Assault is a misdemeanor. You
    must wait five years from the date of your release to seal your records."
  end
end
