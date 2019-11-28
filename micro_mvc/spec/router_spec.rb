describe Router
  describe ".new" do
    it "Sets up Routes hash according to the specified routes" do
      Routes = Router.new do
        match '/' => 'home#index'
        match '/home/index' => 'home#index'
        match '/tasks' => 'tasks#index'
      end

      expect(Routes).to 
    end
  end
end


Routes = Router.new do
  match '/' => 'home#index'
  match '/home/index' => 'home#index'
  match '/tasks' => 'tasks#index'
end