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
end
