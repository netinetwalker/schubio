class BlogController < ApplicationController
  respond_to :html
  respond_to :atom, :only => [:feed]
  before_filter :authenticate_user!, :except => [:index, :feed, :show, :show_tag]

  def index
    @blogposts = Blogpost.paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    @tags = Blogpost.tag_counts_on(:tags)
    if @blogposts
      respond_with @blogposts
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def feed
    @blogposts = Blogpost.limit(5).order(:updated_at => "DESC")
    respond_with @blogposts do |format|
      format.atom
    end
  end

  def show
    @blogpost = Blogpost.find(params[:id])
    @blogpost_comment = BlogpostComment.new

    if @blogpost
      respond_with @blogpost
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def show_tag
    @blogposts = Blogpost.tagged_with(params[:id]).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
    @tags = Blogpost.tag_counts_on(:tags)

    if @blogposts
      respond_with @blogpost do |format|
        format.html { render 'index' }
      end
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def new
    @blogpost = Blogpost.new
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
    @blogpost.tag_list = @blogpost.tags.join(", ")
  end

  def create
    @blogpost = Blogpost.new(params[:blogpost])

    respond_to do |format|
      if @blogpost.save
        format.html { redirect_to(@blogpost) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @blogpost = Blogpost.find(params[:id])

    if @blogpost.update_attributes(params[:blogpost])
      redirect_to @blogpost
    else
      render :action => "edit"
    end
  end

  def destroy
    @blogpost = Blogpost.find(params[:id])
    @blogpost.destroy

    respond_to do |format|
      format.html { redirect_to(blogposts_path) }
    end
  end
end
