class MoreCrimesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:yes_or_no] == "no"
      # if current_user.records.any? {|record| !record.eligible?}

    else params[:yes_or_no] == "yes"
      redirect_to new_record_path
    end
  end

  def new
    render :new
  end
end
