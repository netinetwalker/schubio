class ProjectsController < ApplicationController
  def index
    @projects = Project.order(:title).all()
    @introduction = Page.find_by_url("projects_introduction")
  end

  def show
    @projects = Project.order(:title).all()
    @project = Project.find(params[:id])
  end
end
