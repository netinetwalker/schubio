class Blogpost < ActiveRecord::Base
  has_many :blogpost_comments
  acts_as_taggable

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def tag_list
    self.tags.join(", ")
  end

  def tag_list=(tag_list)
    self.tag_list = tag_list
  end
end
