require 'rails_helper'

feature 'user does not have cori report', %{
  As a signed in User, without his CORI report
  I am instructed on where to obtain my criminal history
  So that I can use the site
} do
  # Acceptance Criteria:
  # * User must be signed in to see the eligibility form
  #  If the user does not have their CORI, they are instructed how to obtain it.
  scenario 'there is no signed in user', js: true do
    user = FactoryGirl.create(:user)

    visit "/"

    expect(page).to have_no_content("Do you have your CORI report?")

  end
  scenario 'user signs in and does not have CORI report', js: true do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button "Log in"

    choose 'yes_or_no_no'
    click_on('Submit')

    expect(page).to have_content("Here is how to get your CORI")
  end
end
