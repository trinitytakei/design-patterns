require 'pry'

class Router
  def self.new(&block)
    @routes = {}
    instance_eval(&block)
    @routes
  end

  def self.match(route_hash)
    path, controller_action = route_hash.first

    @routes[path] = controller_action.split('#')
  end
end


Routes = Router.new do
  match '/' => 'home#index'
  match '/home/index' => 'home#index'
  match '/tasks' => 'tasks#index'
end