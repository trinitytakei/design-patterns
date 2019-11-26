# frozen_string_literal: true

require_relative '../impl/application_controller.rb'

class HomeController < ApplicationController
  def index
    response.write 'Hello From index!'
  end
end
