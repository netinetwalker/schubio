atom_feed do |feed|
  feed.title("Dennis Schubert - Blog")
  feed.updated(@blogposts.first.updated_at)

  for blogpost in @blogposts
    feed.entry(blogpost) do |entry|
      entry.title(blogpost.title)

      sort_tags(blogpost.tags).each do |tag|
        entry.category(:term => tag)
      end

      entry.author do |author|
        author.name("Dennis Schubert")
      end

      entry.content(format(blogpost.content), :type => 'html')
    end
  end
end
