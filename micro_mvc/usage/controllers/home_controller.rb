require_relative '../../impl/controller/application_controller.rb'

class HomeController < ApplicationController
  def index
    render :index
  end
end