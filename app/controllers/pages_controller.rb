class PagesController < ApplicationController
  respond_to :html
  before_filter :load_page, :except => [:index]
  before_filter :check_http_auth, :except => [:index]

  def index
    redirect_to root_path
  end

  def show
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

  private

    def load_page
      @page = Page.where({:url => params[:id]}).first
    end

    def check_http_auth
      return true if current_user

      if @page and @page.http_auth?
        if authenticate_with_http_basic do |user, password|
            @page.http_auth_users_hash.include?(user) and @page.http_auth_users_hash[user] == Digest::SHA1.hexdigest(password)
          end
        else
          response.headers["WWW-Authenticate"] = %(Basic realm="Protected content")
          render_401
        end
      end
    end
end
