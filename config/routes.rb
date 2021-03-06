OdcInduction::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#homepage'
   
   get '/associate' => 'users/associates#associate_home'
   get '/admin' => 'users/admins#admin_home'
   get '/tag_mentor' => 'users/admins#tag_mentor'
   post '/tag_mentor' => 'users/admins#tag_mentor_update'
   post '/edit_role' => 'users/admins#edit_role'
   get '/change_role' => 'users/admins#change_role'
   #post '/create_update' => 'users/associates#create_update'
   #post '/create_comment' => 'comment#create_comment'
   
   post '/import_users' => 'users/admins#import_users'
   get '/mentees_updates' => 'users/admins#view_mentees_updates'
   post '/email_updates' => 'users/admins#email_updates'
   delete '/destroy_user' => 'users/admins#destroy_user'
   #delete '/destroy_comment' => 'users/associates#destroy_comment'

   resources :comments, only: [:destroy, :create]
   resources :updates, only: [:create]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
