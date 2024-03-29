# frozen_string_literal: true

require_relative '../impl/application.rb'
require_relative '../usage/home_controller.rb'

describe Application do
  before(:each) do
    @app = Application.new
  end

  describe '#route' do
    it 'generates a controlle/action from a request' do
      expect(@app.route('/home/index')).to eq(%w[home index])
      expect(@app.route('/')).to           eq(%w[home index])
      expect(@app.route('/users')).to      eq(%w[users index])
      expect(@app.route('/users/show')).to eq(%w[users show])
    end
  end

  describe '#load_controller_class' do
    it 'Loads and returns the controller class based on the controller name' do
      klass = @app.load_controller_class('home')

      expect(klass).to eq(HomeController)
    end
  end
end

