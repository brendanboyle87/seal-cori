class CoriQuestionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:yes_or_no] == "no"
      redirect_to "/pages/nocori"
    elsif params[:yes_or_no] == "yes"
      redirect_to new_sex_offender_path
    else
      redirect_to "/"
    end
  end
end
