class Blogpost < ActiveRecord::Base
  has_many :blogpost_comments
  acts_as_taggable

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def tags_string
    self.tags.join(", ")
  end

  def tags_string=(tags)
    self.tag_list = tags
  end
end
