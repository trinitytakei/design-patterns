Routes = Router.new do
  match '/' => 'home#index'
  match '/home/index' => 'home#index'
  match '/tasks' => 'tasks#index'
end