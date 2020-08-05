class ContactMailsController < ApplicationController
  def new
    @contact = ContactMail.new
  end

  def create
    @contact = ContactMail.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to new_contact_path
    else
      redirect_to new_contact_path
    end
  end

  private

  def contact_params
    params.require(:contact_mail).permit(:name, :email, :subject, :message)
  end
end
