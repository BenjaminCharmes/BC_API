class ContactMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    mail(to: 'benjamin.charmes+portfolio@gmail.com', subject: @contact.subject)
  end
end
