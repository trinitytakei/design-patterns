require_relative '../../impl/controller/application_controller.rb'
require_relative '../../usage/models/task.rb'

class TasksController < ApplicationController
  def index
    response.write <<~HTML
    <html>
      </body>
        <ul>
          #{task_list(Task.all)}
        </ul>
      </body>
    </html>
    HTML
  end

private
   def task_list(tasks)
    tasks.each_with_object('') { |task, html|
      html << "<li>#{task.name}</li>"
    }.strip
   end
end