ActionController::Routing::Routes.draw do |map|
  map.resources :payments, :only=>[:new,:create], :collection=>{:confirmation=>:post}
end
