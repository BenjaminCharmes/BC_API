class ContactMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    mail(to: @contact.email, subject: @contact.subject)
  end
end
