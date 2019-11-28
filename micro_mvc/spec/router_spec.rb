require_relative '../usage/config/routes.rb'



describe Router do
  describe ".new" do
    it "Sets up Routes hash according to the specified routes" do
      routes_result = {
        '/' => ['home', 'index'],
        '/home/index' => ['home', 'index'],
        '/tasks' => ['tasks', 'index']
      }

      routes = Router.new do
        match '/' => 'home#index'
        match '/home/index' => 'home#index'
        match '/tasks' => 'tasks#index'
      end

      expect(routes).to eq(routes_result)
    end
  end
end