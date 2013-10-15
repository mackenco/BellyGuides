class SessionsController < ApplicationController
  before_filter :require_no_current_user!, :only => [:create, :new]
  before_filter :require_current_user!, :only => [:destroy]

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render :json => "Credentials were wrong"
    else
      self.current_user = user
      flash.notice = "Welcome back, #{current_user.username}!"
      redirect_to user_url(user)
    end
  end

  def destroy
    flash.notice = "Goodbye #{current_user.username}!"
    logout_current_user!
    redirect_to new_session_url
  end

  def new
  end
end