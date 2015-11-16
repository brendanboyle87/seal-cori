class PdfMailer < ApplicationMailer
  def new_pdf(personal_information)
    @personal_information = personal_information

    attachments['petition.pdf'] = File.read("#{Rails.root}/lib/assets/sealingpetition#{@personal_information.user.id}.pdf")
    mail(
      to: personal_information.user.email,
      subject: "Your Petition to Seal"
    )
  end
end
