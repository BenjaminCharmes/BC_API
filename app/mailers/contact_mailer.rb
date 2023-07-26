class ContactMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact
    mail(to: 'votre_adresse_email@gmail.com', subject: @contact.subject)
  end
end
