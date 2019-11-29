require_relative '../impl/router.rb'
require 'pry'

describe Router do
  describe 'routes' do
    it 'returns controller/action array according to the specified routes' do
      routes = Router.new do
        match '/' => 'home#index'
        match '/home/index' => 'home#index'
        match '/tasks' => 'tasks#index'
      end

      expect(routes.route('/')).to eq(['home', 'index'])
      expect(routes.route('/home/index')).to eq(['home', 'index'])
      expect(routes.route('/tasks')).to eq(['tasks', 'index'])
    end
  end
end
