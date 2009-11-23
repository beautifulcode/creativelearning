ActionController::Routing::Routes.draw do |map|
  map.resources :registration_forms


  # ADMIN LOGIN/LOGOUT
  map.resources :users
  map.resource :session
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  %w(pages class_schedules semesters seminars teachers registrations questions calendars comments testimonials newsletters events).each do |resource|
    map.resources resource.to_sym
  end

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
   map.root :controller => "pages", :action => "show", :id => 'home'
   map.sitemap 'sitemap', :controller => 'pages', :action => 'sitemap'
   
   map.admin '/admin', :controller => "application", :action => "admin"
  
  # Install the default route as the lowest priority.
  # map.connect ':controller/:action/:id.:format'
  # map.connect ':controller/:action/:id'
  
  # map.connect '/:id', :controller => 'pages', :action => 'show'
  
  map.connect '*path', :controller => 'pages', :action => 'show'

  
end
