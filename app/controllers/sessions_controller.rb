class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by username: params[:username]

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Signed in successfully.'
      redirect_to root_url
    else
      flash.now[:error] = 'Something went wrong. Please try again.'
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Signed out successfully.'
    redirect_to root_url
  end
end
