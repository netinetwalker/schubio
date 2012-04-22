class ProjectsController < ApplicationController
  def index
    @projects = Project.all()
    @introduction = Page.find_by_url("projects_introduction")
  end

  def show
    @project = Project.find(params[:id])
  end
end
