atom_feed do |feed|
  feed.title("Dennis Schubert - Blog-comments")
  feed.updated(@blogpost_comments.first.updated_at)

  for blogpost_comment in @blogpost_comments
    feed.entry(blogpost_comment) do |entry|
      entry.title("Comment from '" + blogpost_comment.author + "' at '" + blogpost_comment.blogpost.title + "'")

      entry.author do |author|
        author.name(blogpost_comment.author)
      end

      entry.content(comment_format(blogpost_comment.content), :type => 'html')
    end
  end
end
