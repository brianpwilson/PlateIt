class LoginController < ApplicationController
  
  def add_user
    @user = User.new(params[:user])
    if( request.post? and @user.save )
      flash.now[:notice] = "#{@user.name} created"
      @user = User.new
    end
  end

  def login
  end

  def logout
  end

  def index
  end

  def delete_user
  end

  def list_users
    @users = User.find(:all)
  end

end