# start with
# shotgun -I.

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name)

    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process action_name

    response.finish
  end

  def route(path)
    _, controller_name, action_name = path.split('/')

    [controller_name || 'home', action_name || 'index']
  end

  def load_controller_class(name)
    require_relative "../usage/controllers/#{name}_controller.rb"

    Object.const_get "#{name.capitalize}Controller"
  end
end
