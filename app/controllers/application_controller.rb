class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::RoutingError, :with => :render_404
  protect_from_forgery

  def render_404
    render :template => "errors/404", :layout => 'application', :status => 404
  end
end
