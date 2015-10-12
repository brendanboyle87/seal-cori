class PersonalInformationsController < ApplicationController
  def new
    @personal_information = PersonalInformation.new
  end

  def create
    @personal_information = PersonalInformation.new(personal_info_params)
    @personal_information.user = current_user
    if @personal_information.save

    else
      flash[:errors] = @personal_information.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def personal_info_params
    params.require(:personal_information).permit(:middle_name, :previous_name,
    :date_of_birth, :address, :city, :state, :zip, :occupation,
    :hometown, :father_name, :mother_maiden, :spouse_name)
  end
end
