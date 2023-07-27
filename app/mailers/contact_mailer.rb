class ContactMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    mail(to: 'charmes.benjamin@hotmail.fr', subject: @contact.subject)
  end
end
