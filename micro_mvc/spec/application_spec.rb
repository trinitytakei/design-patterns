# frozen_string_literal: true

require_relative '../impl/application.rb'
require_relative '../usage/controllers/tasks_controller.rb'

describe Application do
  before(:each) do
    @app = Application.new
  end

  describe '#route' do
    Routes = Router.new do
      match '/' => 'home#index'
      match '/users/index' => 'users#index'
      match '/tasks' => 'tasks#index'
      match '/tasks/show' => 'tasks#show'
    end

    it 'generates a controlle/action from a request' do
      expect(@app.route('/users/index')).to eq(%w[users index])
      expect(@app.route('/')).to            eq(%w[home index])
      expect(@app.route('/tasks')).to       eq(%w[tasks index])
      expect(@app.route('/tasks/show')).to  eq(%w[tasks show])
    end
  end

  describe '#load_controller_class' do
    it 'Loads and returns the controller class based on the controller name' do
      klass = @app.load_controller_class('tasks')

      expect(klass).to eq(TasksController)
    end
  end
end

