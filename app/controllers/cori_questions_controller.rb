class CoriQuestionsController < ApplicationController
  def index
    if params[:yes_or_no] == "no"
      redirect_to "/pages/nocori"
    elsif params[:yes_or_no] == "yes"
      redirect_to ""
    else
      redirect_to "/"
    end
  end
end
