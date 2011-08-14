class BlogpostComment < ActiveRecord::Base
  belongs_to :blogpost
  attr_accessor :antispam, :correct_antispam
  validates_presence_of :antispam, :correct_antispam, :author, :email, :content
end
