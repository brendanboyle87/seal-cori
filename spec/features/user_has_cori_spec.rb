require 'rails_helper'

feature 'user has cori report', %{
  As a signed in User, with my CORI report
  I want to find out if I am eligible to have my records sealed
} do
  # Acceptance Criteria:
  #
  scenario 'there is no signed in user', js: true do
   user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button "Log in"

    choose 'yes_or_no_yes'
    click_on('Submit')

    expect(page).to have_content("Please provide the following information:")
  end
end
