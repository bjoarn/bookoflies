# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # there is no direct access to the current_user controller action from the view, so we use this helper method as a proxy
  def current_person
    @controller.send(:current_person)
  end
  
  def person_logged_in?
    !current_person.nil?
  end


end
