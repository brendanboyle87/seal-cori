require 'rails_helper'

feature 'user with crimes eligible to be sealed', %{
  As a signed in User, who has an eligible crime. I want to know what I
  need to do to seal my records.
} do
  # Acceptance Criteria:
  # User with eligible misdemeanor with more crimes is instructed to enter more.
  # User with eligible misdemeanor with no more crimes is instructed to enter their personal information.
  # User with eligibe felony is instructed to enter their personal information.
  # User with eligible misdemeanor but ineligible second crime is given information on alternative sealing processes.

  scenario 'user has eligible misdemeanor with no additional crimes', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Simple Assault"
    choose('felony_or_misdemeanor_misdemeanor')

    fill_in 'datepicker', with: "08/08/2009"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "This crime is eligible to be sealed! Now we need to check
    if there are other crimes on your report."

    choose('yes_or_no_no')
    click_button "Submit"

    choose('yes_or_no_no')
    click_button "Submit"

    expect(page).to have_content 'Congrats! You are elibigble! Please fill out the information below:'
  end

  scenario 'users first crime is an eligible felony', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')

    fill_in 'datepicker', with: "08/08/2003"
    find("#eligibility-submit").trigger('click')

    choose('yes_or_no_no')
    click_button "Submit"

    expect(page).to have_content 'Congrats! You are elibigble! Please fill out the information below:'
  end

  scenario 'user has eligible misdemeanor and an ineligible felony conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Simple Assault"
    choose('felony_or_misdemeanor_misdemeanor')

    fill_in 'datepicker', with: "08/08/2009"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "This crime is eligible to be sealed! Now we need to check
    if there are other crimes on your report."

    choose('yes_or_no_yes')
    click_button "Submit"

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')
    choose('convicted_yes')

    fill_in 'datepicker', with: "08/08/2008"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "Aggravated Assault is not eligible to be sealed at this time"
  end

  scenario 'user has eligible misdemeanor and an ineligible felony non-conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Simple Assault"
    choose('felony_or_misdemeanor_misdemeanor')

    fill_in 'datepicker', with: "08/08/2009"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "This crime is eligible to be sealed! Now we need to check
    if there are other crimes on your report."

    choose('yes_or_no_yes')
    click_button "Submit"

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_felony')


    fill_in 'datepicker', with: "08/08/2008"
    find("#eligibility-submit").trigger('click')

    choose('yes_or_no_no')
    click_button "Submit"

    choose('yes_or_no_no')
    click_button "Submit"

    expect(page).to have_content 'Congrats! You are elibigble! Please fill out the information below:'
  end

  scenario 'user has eligible misdemeanor and an ineligible misdemeanor non-conviction', js: true do
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    question_one_two

    fill_in 'Name of Crime', with: "Simple Assault"
    choose('felony_or_misdemeanor_misdemeanor')

    fill_in 'datepicker', with: "08/08/2012"
    find("#eligibility-submit").trigger('click')

    expect(page).to have_content "This crime is not eligible to be sealed"

    choose('yes_or_no_yes')
    click_button "Submit"

    fill_in 'Name of Crime', with: "Aggravated Assault"
    choose('felony_or_misdemeanor_misdemeanor')


    fill_in 'datepicker', with: "08/08/2008"
    find("#eligibility-submit").trigger('click')

    choose('yes_or_no_no')
    click_button "Submit"

    choose('yes_or_no_no')
    click_button "Submit"

    expect(page).to have_content 'Congrats! You are elibigble! Please fill out the information below:'
  end
end
