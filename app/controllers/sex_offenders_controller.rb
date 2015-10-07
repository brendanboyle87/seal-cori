class SexOffendersController < ApplicationController
  def index
    if params[:yes_or_no] == "yes"
      redirect_to "/pages/sexoffender"
    elsif params[:yes_or_no] == "no"
      redirect_to ""
    else
      redirect_to "/"
    end
  end

  def new
    render :new
  end
end
