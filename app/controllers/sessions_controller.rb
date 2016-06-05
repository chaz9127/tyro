class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    @user = User.find_by_credentials(email, password)
    if @user
      log_in!(@user)
      redirect_to user_url(@user)
    else
      @user = User.new
      # flash.now[:errors] = ["Invalid username or password"]
      # debugger
      render :new
    end
  end

  def destroy

  end
end
