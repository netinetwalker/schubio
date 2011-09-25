class BlogController < ApplicationController
  respond_to :html
  respond_to :atom, :only => [:feed]

  def index
    @blogposts = Blogpost.where("is_draft = 0").order("created_at DESC").page(params[:page]).per(5)
    @tags = Blogpost.tag_counts_on(:tags)
    if @blogposts
      respond_with @blogposts
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def feed
    @blogposts = Blogpost.where("is_draft = 0").order("created_at DESC").limit(5)
    respond_with @blogposts do |format|
      format.atom
    end
  end

  def show
    @blogpost = Blogpost.where("is_draft = 0").find(params[:id])
    @blogpost_comment = BlogpostComment.new

    if @blogpost
      respond_with @blogpost
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def show_tag
    @blogposts = Blogpost.where("is_draft = 0").tagged_with(params[:id]).order('created_at DESC').page(params[:page]).per(5)
    @tags = Blogpost.tag_counts_on(:tags)

    if @blogposts
      respond_with @blogpost do |format|
        format.html { render 'index' }
      end
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
