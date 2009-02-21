# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ee18d7601e719ed3c9e2ddccc6736b59'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  def authenticate
    if current_person
      return true
    else
      session[:original_uri] = request.request_uri
      flash[:notice] = "Log ind for at anvende denne funktion"
      # note: remove the preceding slash ('/') to redirect relative (eg. admin/accounts, login)
      redirect_to({ :controller => "/people", :action => "login" })
    end
  end
  
  attr_reader :current_person
  def current_person
    @current_person ||= Person.find_by_id(session[:person_id]) # use find_by_id to avoid exceptions when not found
  end
end
