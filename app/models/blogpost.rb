class Blogpost < ActiveRecord::Base
  has_many :blogpost_comments
  acts_as_taggable
  validates_associated :blogpost_comments

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
