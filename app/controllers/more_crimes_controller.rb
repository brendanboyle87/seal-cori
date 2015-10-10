class MoreCrimesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:yes_or_no] == "no"
      current_user.records.each do |record|
        if !record.eligible? && record.convicted?
          redirect_to record_path(record)
          return
        end
      end

      redirect_to new_personal_information_path
      return
    else params[:yes_or_no] == "yes"
      redirect_to new_record_path
    end
  end

  def new
    render :new
  end
end
