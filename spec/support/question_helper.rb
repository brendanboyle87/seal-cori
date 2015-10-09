module QuestionHelper
  def question_one_two
    choose 'yes_or_no_yes'
    click_on('Submit')

    choose 'yes_or_no_no'
    click_on('Submit')
  end
end
