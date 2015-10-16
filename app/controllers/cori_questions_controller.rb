class CoriQuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:yes_or_no] == "no"
        redirect_to "/pages/nocori"
    elsif params[:yes_or_no] == "yes"
      respond_to do |format|
        format.html {
        redirect_to new_sex_offender_path }
        format.json { render json: { action: "/sex_offenders", id: "sex-offender-question",
        paragraph: "Have you been a registered sex offender at any point in the last 15 years?"}
      }
      end
    else
      redirect_to "/"
    end
  end
end
