class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password_digest])
  		session[:user_id] = user.user_id
  		redirect_to root_url, notice: "Logged in!"
  	else
  		flash.now.alert = "Email or password is invalid"
  		render "new"
  	end
  end
end
