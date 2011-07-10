class PageController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @page = Page.where({:url => params[:pageUrl]}).first
  end
end
