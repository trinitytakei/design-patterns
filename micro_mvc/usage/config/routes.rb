require_relative '../../impl/router.rb'

Routes = Router.new do
  match '/' => 'tasks#index'
  match '/tasks/index' => 'home#index'
  match '/tasks' => 'tasks#index'
end