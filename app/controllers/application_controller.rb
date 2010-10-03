class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to(:controller => "home", :action => "index")
    end
  end
end
