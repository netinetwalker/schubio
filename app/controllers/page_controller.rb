class PageController < ApplicationController
  respond_to :html
  
  def index
    redirect_to root_path
  end

  def show
    @page = Page.where({:url => params[:id]}).first
    if @page
      respond_with @page
    else
      raise ActiveRecord::RecordNotFound
    end
  end
  
  def new
    @page = Page.new
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to page_path({:id => @page.url})
    else
      render :action => "edit"
    end
  end
  
end
