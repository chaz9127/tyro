class UsersController < ApplicationController

  def show
    render text: "#{current_user.email}"
  end

end
