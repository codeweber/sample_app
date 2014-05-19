class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #signin user
      sign_in user
      redirect_to user
    else
      #display error
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end


  end

  def destroy
  end

end
