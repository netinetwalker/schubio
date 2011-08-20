class BlogpostCommentsController < ApplicationController
  respond_to :html, :atom

  before_filter :authenticate_user!, :except => [:feed, :create]

  def feed
    @blogpost_comments = BlogpostComment.limit(5).order(:created_at => "DESC")

    # is that really needed?
    for comment in @blogpost_comments
      comment.blogpost.title = "foo"
    end

    respond_with @blogpost_comments do |format|
      format.atom
    end
  end

  def create
    @blogpost = Blogpost.find(params[:blogpost_id])
    @blogpost_comment = @blogpost.blogpost_comments.create(params[:blogpost_comment])
    if @blogpost_comment.save
      redirect_to @blogpost
    else
      render 'blog/show'
    end
  end

  def destroy
    @blogpost_comment = BlogpostComment.find(params[:id])
    @blogpost = Blogpost.find(params[:blogpost_id])
    @blogpost_comment.destroy

    redirect_to @blogpost
  end
end
