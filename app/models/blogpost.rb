class Blogpost < ActiveRecord::Base
  has_many :blogpost_comments
  acts_as_taggable

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
