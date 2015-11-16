class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(personal_information)
    @personal_information = personal_information
    PdfMailer.new_pdf(@personal_information).deliver_later
  end
end
