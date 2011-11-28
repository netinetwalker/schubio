class ContactMailer < ActionMailer::Base
  default :from => AppConfig[:smtp_sender_address]

  def contact_email(name, email, subject, message)
    @name = name
    @email = email
    @subject = ['[Contact request] ', subject]
    @message = message
    mail(:to => AppConfig[:smtp_sender_address], :subject => @subject)
  end
end
