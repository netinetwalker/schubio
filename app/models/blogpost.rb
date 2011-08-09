class Blogpost < ActiveRecord::Base
  belongs_to :user
  has_many :blogpost_comments
end
