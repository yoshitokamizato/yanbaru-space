class ContactMailsController < ApplicationController

  def new
    @contact = ContactMail.new
  end

  def create
    @contact = ContactMail.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to contact_mail_path(@contact), notice: "お問い合わせを受け付けました。"
    else
      redirect_to new_contact_mail_path, alert: "入力に不備があります。"
    end
  end

  def show
    @contact = ContactMail.find(params[:id])
  end

    private

  def contact_params
    params.require(:contact_mail).permit(:name, :email, :subject, :message)
  end
end