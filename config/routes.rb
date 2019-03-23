Rails.application.routes.draw do
  get '/:tree_id', :to => 'trees#index'
  get '/:tree_id/parent/:id', :to => 'trees#parent_tree'
  get '/:tree_id/child/:id', :to => 'trees#child_tree'
  resources :trees do 
		get :child_tree, on: :collection
		get :parent_tree, on: :collection
	end
end
