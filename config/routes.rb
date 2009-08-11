ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "places", :action => 'keep_me_posted'
  # 
  # map.resources :people, :only => [:index, :show]
  # 
  # map.resources :places, :member => { :employ => :post, :unemploy => :delete}
  # 
  # map.resource :account, :only => [:create, :edit, :update, :destroy],
  #                        :collection => { :signup => :get, 
  #                                         :login => [:get, :post], 
  #                                         :logout => :get, 
  #                                         :forgot_password => [:get, :post],
  #                                         :change_password => [:get, :post] }
  # map.connect 'account', :controller => 'accounts', :action => 'edit'
  # 
  # map.about 'about', :controller => 'static_pages', :action => 'about'
  
end
