class RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
  end

  def create
    binding.pry
  end

  private

  def record_params
    if params[:felony_or_misdemeanor] == "misdemeanor"
       params[:record][:misdemeanor] = true
    else
       params[:record][:felony] = true
    end

    if params[:convicted] == "true"
      params[:record][:convicted] = true
    else
      params[:record][:convicted] = true
    end

    params[:record][:disposition_date] = Date.strptime(params[:record][:disposition_date],'%d/%m/%Y')
    params.require(:record).permit(:crime_name,:disposition_date, :convicted, :msdemeanor, :felony)
  end
end
