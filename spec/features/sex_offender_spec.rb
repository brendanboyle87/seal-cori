require 'rails_helper'

feature 'user is a registrered sex offender or has been one', %{
  As a signed in User, with his CORI report who is a registrered
  sex-offender (or has been one in the past 15 years) I want to find out
  the special steps I need to take to seal my records.
} do
  # Acceptance Criteria:
  # * User must be signed in to see the eligibility form
  #  If the user does not have their CORI, they are instructed how to obtain it.
  scenario 'user is a regsitered sex offender or has been in the past 15 years' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    choose 'yes_or_no_yes'
    click_on('Submit')

    choose 'yes_or_no_yes'
    click_on('Submit')

    expect(page).to have_content("There are special rules
    related to sex offenders sealing criminal records.")
  end
end
