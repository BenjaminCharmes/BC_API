class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_email(@contact).deliver_now
      render json: { message: 'E-mail envoyé avec succès !' }
    else
      render json: { error: "Erreur lors de l'envoi de l'e-mail. " + @contact.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end
  private
  def contact_params
    params.require(:contact).permit(:email, :subject, :message)
  end
end