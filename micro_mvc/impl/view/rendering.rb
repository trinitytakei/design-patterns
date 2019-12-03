# frozen_string_literal: true

require 'erb'

module Rendering
  def render(action)
    @message = "An instance variable"
    response.write render_to_string(action)
  end

  private

  def render_to_string(action)
    template = File.read(template_path(action))
    ERB.new(template).result(binding)
  end

  def template_path(action)
    "./views/#{controller_name}/#{action}.html.erb"
  end

  def controller_name
    self.class.to_s.gsub('Controller', '').downcase
  end
end
