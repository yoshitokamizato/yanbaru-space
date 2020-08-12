class ContactMailsController < ApplicationController

  def new
    @contact = ContactMail.new
  end

  def create
    # binding.pry
    @contact = ContactMail.new(contact_params)
    redirect_to new_contact_mail_path, alert: "入力に不備があります。" unless @contact.save!
  end

    private

  def contact_params
    params.require(:contact_mail).permit(:name, :email, :subject, :message)
  end
end