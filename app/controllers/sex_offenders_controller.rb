class SexOffendersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:yes_or_no] == "yes"
      redirect_to "/pages/sexoffender"
    elsif params[:yes_or_no] == "no"
      redirect_to new_record_path
    else
      redirect_to "/"
    end
  end

  def new
    render :new
  end
end
