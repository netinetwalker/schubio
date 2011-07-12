class RegistrationsController < Devise::RegistrationsController
  before_filter :check_registrations_open!

  def create
    super
  end

  def new
    super
  end

  private
  def check_registrations_open!
    if AppConfig[:closed_registrations]
      redirect_to new_user_session_path
    end
  end
end
