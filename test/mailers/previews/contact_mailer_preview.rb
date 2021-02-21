# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact
    contact = Contact.new(name: "片岡楓太", contact: "問い合わせメッセージ")
    ContactMailer.contact_mail(contact)
  end
end
