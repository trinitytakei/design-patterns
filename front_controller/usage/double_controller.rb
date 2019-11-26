# frozen_string_literal: true

require_relative '../impl/application_controller.rb'

class DoubleController < ApplicationController
  def index
    response.write request['input']*2
  end
end