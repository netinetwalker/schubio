class PageController < ApplicationController
  respond_to :html
  
  def index
    redirect_to root_path
  end

  def show
    @page = Page.where({:url => params[:pageUrl]}).first
    if @page
      respond_with @page
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
