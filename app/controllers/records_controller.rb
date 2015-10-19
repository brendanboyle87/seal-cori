class RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user = current_user
    if @record.save
      unless @record.eligible?
        if !@record.convicted?
          flash[:notice] = "This crime is not eligible to be sealed yet."
          session[:crime_count] = 1
          redirect_to new_more_crime_path
          return
        else
          redirect_to record_path(@record)
          return
        end
      end

      if @record.banned?
        redirect_to record_path(@record)
        return
      elsif @record.misdemeanor?
        flash[:notice] = "This crime is eligible to be sealed! Now we need to check
        if there are other crimes on your report."
        session[:crime_count] = 1
        redirect_to new_more_crime_path
        return
      else
        redirect_to new_other_state_path
        return
      end
    else
      flash[:errors] = @record.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @record = Record.find(params[:id])
    authorize_user(@record)
  end

  private

  def record_params
    if params[:felony_or_misdemeanor] == "misdemeanor"
       params[:record][:misdemeanor] = true
    else
       params[:record][:felony] = true
    end

    if params[:convicted] == "yes"
      params[:record][:convicted] = true
    else
      params[:record][:convicted] = false
    end
    date = params[:record][:disposition_date]
    unless date.empty?
      params[:record][:disposition_date] = Date.strptime(date, '%m/%d/%Y')
    end
    params.require(:record).permit(
    :crime_name,:disposition_date, :convicted, :misdemeanor, :felony)
  end

  def authorize_user(record)
    unless current_user == record.user
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
