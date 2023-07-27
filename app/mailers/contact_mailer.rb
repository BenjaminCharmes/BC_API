class ContactMailer < ApplicationMailer

  def send_email(contact)
    @contact = contact
    mail(to: 'benjamin.charmes@gmail.com', subject: @contact.subject)
  end
  
end