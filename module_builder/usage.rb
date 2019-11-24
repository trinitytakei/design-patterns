require_relative './impl.rb'

class ApiResponse
  def initialize(status, json)
    # do fancy stuff with status and json
  end
end

ApiResponse.prepend(LoggerBuilder.new(:initialize))

ApiResponse.new(42, {question: "what's the meaning of life?" })