class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact 
    mail(
      to: ENV['MAIL'],
      subject: 'お問い合わせフォームからの通知'
    ) do |format|
      format.text
    end
  end
end
