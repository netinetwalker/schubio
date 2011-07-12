class PagesController < ApplicationController
  respond_to :html
  
  def index
    redirect_to root_path
  end

  def show
    @page = Page.where({:url => params[:id]}).first
        
    if @page
      respond_with @page
    else
      @page = Page.find(params[:id])
      if @page
        respond_with @page
      else
        raise ActiveRecord::RecordNotFound
      end
    end
  end
  
  def new
    @page = Page.new
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def create
    @page = Page.new(params[:post])

    respond_to do |format|
      if @page.save
        format.html { redirect_to(@page) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to page_path({:id => @page.url})
    else
      render :action => "edit"
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to(root_path) }
    end
  end
  
end
