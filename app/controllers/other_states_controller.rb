class OtherStatesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:yes_or_no] == "no"
       redirect_to new_personal_information_path
       return
    else params[:yes_or_no] == "yes"
       redirect_to '/pages/other_states'
    end
  end

  def new
    render :new
  end
end
