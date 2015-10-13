require './app/models/petition_generator.rb'

class PersonalInformationsController < ApplicationController
  def new
    @personal_information = PersonalInformation.new
  end

  def create
    @personal_information = PersonalInformation.new(personal_info_params)
    @personal_information.user = current_user
    if @personal_information.save
      redirect_to personal_information_path(@personal_information)
    else
      flash[:errors] = @personal_information.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @personal_information = PersonalInformation.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        user_pdf = PetitionGenerator.new(@personal_information)
        info = user_pdf.parse_data
        user_pdf.fill_form(info)
        send_file("#{Rails.root}/lib/assets/sealingpetition#{current_user.id}.pdf",
                  filename: "sealingpetition#{current_user.id}.pdf",
                  type: "application/pdf")
      end
    end
  end

  private

  def personal_info_params
    params.require(:personal_information).permit(:middle_name, :previous_name,
    :date_of_birth, :address, :city, :state, :zip, :occupation,
    :hometown, :father_name, :mother_maiden, :spouse_name)
  end
end
