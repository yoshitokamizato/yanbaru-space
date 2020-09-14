class ContactMailsController < ApplicationController

  def new
    @contact = ContactMail.new
  end

  def create
    @contact = ContactMail.new(contact_params)
    ContactMailer.contact_mail(@contact).deliver
    flash.now[:notice] = "お問い合わせを受け付けました。"
    redirect_to new_contact_mail_path, alert: "入力に不備があります。" unless @contact.save!
  end

    private

  def contact_params
    params.require(:contact_mail).permit(:name, :email, :subject, :message)
  end
end