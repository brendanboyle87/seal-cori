require 'rails_helper'

feature 'user who is eligible with no crime in other states', %{
  As a signed in User, who has an eligible crime
  I want to have my information filled out in the appropriate state form.
} do
  # Acceptance Criteria:
  # As an eligible user I am presented with a form to enter my information
  # If I do not enter my information in the proper format I am presented with errors
  # All fields on the form are required to continue
  # If I enter all of the information in the correct format,
  # I am presented with a filled in PDF

  scenario 'user does not fill out any of the required fields' do

    visit new_personal_information_path

    fill_in "Address", with: ""
    fill_in "City", with: ""
    fill_in "Zip Code", with: ""
    fill_in "Place of Birth", with: ""
    fill_in "Father's Name", with: ""
    fill_in "Date of Birth (mm/dd/yyyy)", with: ""

    click_button "Submit"

    expect(page).to have_content "Address can't be blank."
    expect(page).to have_content "City can't be blank."
    expect(page).to have_content "State can't be blank."
    expect(page).to have_content "State is not included in the list."
    expect(page).to have_content "Hometown can't be blank."
    expect(page).to have_content "Father name can't be blank."
    expect(page).to have_content "Zip can't be blank."
    expect(page).to have_content "Zip is not a number."
    expect(page).to have_content "Zip is the wrong length (should be 6 characters)."
    expect(page).to have_content "Date of birth can't be blank"
  end
end
