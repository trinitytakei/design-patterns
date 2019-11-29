class Router
  def initialize(&block)
    @routes = {}
    instance_eval(&block)
  end

  def match(route_hash)
    path, controller_action = route_hash.first
    routes[path] = controller_action.split('#')
  end

  def route(path)
    routes[path]
  end

  private

  attr_reader :routes
end
