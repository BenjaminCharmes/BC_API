class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_email(@contact).deliver_now
      render json: { message: 'E-mail envoyé avec succès !' }
    else
      render json: { error: "Erreur lors de l'envoi de l'e-mail." }, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :subject, :message)
  end
end
