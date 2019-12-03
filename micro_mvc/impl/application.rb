# start with
# shotgun -I.

require_relative '../usage/config/routes.rb'

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name)

    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.response['content-type'] = 'text/html; charset=UTF-8'

    response.write('<html><body>')
    controller.process action_name
    response.write('</body></html>')
    response.finish
  end

  def route(path)
    Routes.route(path)
  end

  def load_controller_class(name)
    require_relative "../usage/controllers/#{name}_controller.rb"

    Object.const_get "#{name.capitalize}Controller"
  end
end
