class ContactMailerPreview < ActionMailer::Preview
  def contact
     contact = ContactMail.new(name: "お名前", message: "問い合わせメッセージ")

     ContactMailer.contact_mail(contact)
    #  ContactMailer.contact_mail(contact).deliver_now
   end
end