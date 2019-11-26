require 'pry'

class App
  def http_get(path)
    if path == '/hi'
      'ohai!'
    else
      "unknown action #{path}, please implement!"
    end
  end

  def call(env)
    request_method = env['REQUEST_METHOD']

    response = get?(request_method) ? http_get(env['PATH_INFO']) : unknown(request_method)

    [
      200,
      { 'Content-Type' => 'text/plain' },
      [ response ]
    ]
  end

  private

  def get?(request_method)
    request_method == 'GET'
  end

  def unknown(request_method)
    "unknown HTTP verb: #{request_method}"
  end
end

run App.new
