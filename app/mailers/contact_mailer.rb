class ContactMailer < ApplicationMailer
  def send_email(contact)
    @contact = contact

    from = Email.new(email: 'benjamin.charmes+portfolio@gmail.com')
    to = Email.new(email: 'benjamin.charmes@gmail.com')
    subject = @contact.subject
    content = Content.new(type: 'text/plain', value: @contact.message)
    mail = Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)

    if response.status_code == 202
      # L'e-mail a été envoyé avec succès
      # Vous pouvez ajouter ici des actions supplémentaires ou un message de réussite si nécessaire
    else
      # Gérer les erreurs d'envoi d'e-mail si nécessaire
    end
  end
end
