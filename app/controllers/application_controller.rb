class ApplicationController < ActionController::Base
  protect_from_forgery
  
 	before_filter :require_login, :except=> [:login,:authenticating]
  
  def index
    redirect_to '/login' unless session[:user_id]
  end
  
  def login
    redirect_to '/' if session[:user_id]
    @user = User.new
  end  
  
  def authenticating
		if (user = User.login(User.new(params[:user])))
		  session[:user_id] = user.id
		  redirect_to '/'  
		else
			flash[:notice] = "User was not found or password is incorrect"
		  redirect_to '/login'
		end
	end
  
  def logout
    session[:user_id] = nil
    redirect_to '/login'
  end
  
  private
    def require_login
      redirect_to '/login' unless session[:user_id]
    end
 
end
