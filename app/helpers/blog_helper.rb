module BlogHelper
  def sort_tags(tags)
    tag_array = []
    tags.each do |tag|
      tag_array.push(tag.to_s)
    end
    tag_array.sort!{ |a, b| a.downcase <=> b.downcase }
    return tag_array
  end

  def gravatar_url(email)
    require 'digest/md5'
    emailhash = Digest::MD5.hexdigest(email)
    size = "&s=50"
    default = "&d=mm"
    imageurl = "http://www.gravatar.com/avatar/" + emailhash + "?" + size + default
    return imageurl
  end
end
