class ContactController < ApplicationController
  def index
    if !params[:name].nil? && !params[:email].nil? &&
       !params[:subject].nil? && !params[:message].nil? &&
       !params[:name].empty? && !params[:email].empty? &&
       !params[:subject].empty? && !params[:message].empty?
      ContactMailer.contact_email(params[:name], params[:email], params[:subject], params[:message]).deliver
    else
      flash[:error] = "Please fill out all fields!"
    end
  end

end
