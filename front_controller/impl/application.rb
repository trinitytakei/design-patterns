# star with
# shotgun -I.
require 'pry'

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name)

    response.write(request.path_info)
    response.finish
  end

  def route(path)
    _, controller_name, action_name = path.split('/')

    [controller_name || 'home', action_name || 'index']
  end

  def load_controller_class(name)
    require_relative "../usage/#{name}_controller.rb"

    Object.const_get "#{name.capitalize}Controller"
  end
end
