class LoginController < ApplicationController
  
  before_filter :authorize, :except => [:login, :add_user]
  
  def add_user
    @user = User.new(params[:user])
    if( request.post? and @user.save )
      session[:user_id] = @user.id
      flash.now[:notice] = "#{@user.name} created"
      @user = User.new
      redirect_to(:action => "index")
    end
  end

  def login
    session[:user_id] = nil
    if( request.post? )
      user = User.authenticate(params[:name], params[:password])
      if( user )
        session[:user_id] = user.id
        redirect_to(:controller => 'login', :action => "index")
      else
        redirect_to(:controller => 'home', :action => "index")
        flash.now[:notice] = "Invalid user/password"
      end
    end
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
