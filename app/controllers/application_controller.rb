class ApplicationController < ActionController::Base
  protect_from_forgery
   
  helper :all
    
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def redirect_referrer_or_default(default)
    redirect_to(request.referrer || default)
  end
  
  def require_user
    if current_user.blank?
      respond_to do |format|
        format.html  {
          authenticate_user!
        }
        format.all { 
          head(:unauthorized)
        }
      end
    end
  end

end
