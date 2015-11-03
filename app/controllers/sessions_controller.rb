class SessionsController < ApplicationController
  def new

  end

   # Authentication logic
 def create
  user = User.find_by_email(params[:email])

  # email_found && params[:password] == hashed_password ?
  if user && user.authenticate(params[:password])
    redirect_to "/"
    flash[:success] = "Logged in!"
  else
    flash[:danger] = "Invalid login credentials."
    render "new"  # sessions#new
  end

 end

 def destroy
  flash[:danger] = "You are now logged out!"
  redirect_to "/"
 end

end
