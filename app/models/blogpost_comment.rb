class BlogpostComment < ActiveRecord::Base
  belongs_to :blogpost
  attr_accessor :antispam, :correct_antispam

  validates_presence_of :antispam, :message => "Please answer the antispam-question."
  validates_presence_of :correct_antispam, :message => "Heh! What are you doing with my formular?"
  validates_presence_of :author, :message => "Please fill out your name."
  validates_presence_of :email, :message => "Please give me your email-address. Don't worry, I'll store it secret."
  validates_presence_of :content, :message => "Wait. You wanna post a comment without a comment?"

  validates_format_of :email, :with  => Devise.email_regexp, :message => "Please provide a valid email-address."
  validates_format_of :antispam, :with => /elephant/i, :message => "The antispam-answer was wrong. Shouldn't be that hard, the answer starts with Eleph..."
end
