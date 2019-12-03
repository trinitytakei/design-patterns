require_relative '../../impl/controller/application_controller.rb'
require_relative '../../usage/models/task.rb'

class TasksController < ApplicationController
  before_action :add_header
  after_action :add_footer

  def index
    @tasks = Task.all
    render :index
  end

private
   def add_header
     response.write "<h2>This is a header</h2>\n"
   end

   def add_footer
     response.write '<h2>This is a footer</h2>'
   end
end