module ApplicationHelper
  def format(text)
    sanitize(textilize(coderay_dressed(text)))
  end

  def textilize(text)
    return RedCloth.new(text).to_html
  end

  def coderay_dressed(text)
    text.gsub!(/\s*@@@(\w*?)\s+(.+?)\s*@@@\s*/m) do
      $1 != '' ? @lang = $1 : @lang = 'ruby' 
      code = CodeRay.highlight($2, @lang, :css => :class)
      "\n\n<notextile>#{code.strip}</notextile>\n\n"
    end
    return text.html_safe
  end

  def page_title(title)
    if title.empty?
      return "Dennis Schubert"
    else
      return (title + " - Dennis Schubert")
    end
  end

  def page_pagination(pagination)
    if pagination.empty?
      return ""
    else
      return pagination
    end
  end
end
