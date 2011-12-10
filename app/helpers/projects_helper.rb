module ProjectsHelper
  def form_source_link(link)
    if link.include? "github.com"
      repo_name = link.sub("https://github.com/", "")
      link = link_to "GitHub: #{repo_name}", link, {:class => "source_link github_link", :target => "_blank"}
    else
      link = link_to "Go to the source", link, {:class => "source_link", :target => "_blank"}
    end
    return link
  end
end
