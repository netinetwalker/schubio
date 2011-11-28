class ContactMessage
  attr_accessor :name, :email, :subject, :message

  def send
    ContactMailer.contact_email("name", "email", "subject", "message").deliver
  end
end
