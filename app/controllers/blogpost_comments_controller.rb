class BlogpostCommentsController < ApplicationController
  def create
    @blogpost = Blogpost.find(params[:blogpost_id])
    #@blogpost_comment = @blogpost.blogpost_comments.create(params[:blogpost_comment])
    @blogpost_comment = @blogpost.blogpost_comments.build(params[:blogpost_comment])
    if @blogpost_comment.save!
      redirect_to @blogpost
    else
      redirect_to @blogpost
    end
  end
end
