module BlogpostCommentsHelper
  include RedCloth::Formatters::Base
  def comment_format(text)
    textiled = RedCloth.new(text)
    textiled.filter_html = true
    parsed = textiled.to_html
    parsed.chomp!

    sanitize(parsed, :tags => %w(p strong em))

    #return parsed
  end
  ALLOWED_TAGS = {
    'i' => nil,
    'u' => nil,
    'b' => nil,
    'cite' => nil,
    'strong' => nil,
    'em' => nil,
    'p' => nil,
  }
end
