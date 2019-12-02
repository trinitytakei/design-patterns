require_relative '../impl/controller/application_controller'

class FilterTestBeforeController < ApplicationController
  before_action :before

  def initialize(out)
    @out = out
  end

  def before
    @out << :before
  end

  def index
    @out << :index
  end
end

class FilterTestAfterController < ApplicationController
  after_action :after

  def initialize(out)
    @out = out
  end

  def after
    @out << :after
  end

  def index
    @out << :index
  end
end

class FilterTestBeforeAfterController < ApplicationController
  after_action :after
  before_action :before

  def initialize(out)
    @out = out
  end

  def before
    @out << :before
  end

  def after
    @out << :after
  end

  def index
    @out << :index
  end
end

# def around
#   @out << :around_before
#   yield
#   @out << :around_after
# end

describe 'Filter' do
  describe '.before_action' do
    it 'executes code before the index action' do
      out = []
      FilterTestBeforeController.new(out).process(:index)

      expect(out).to eq(%i[before index])
    end

    it 'executes code after the index action' do
      out = []
      FilterTestAfterController.new(out).process(:index)

      expect(out).to eq(%i[index after])
    end

    it 'executes code before and after the index action' do
      out = []
      FilterTestBeforeAfterController.new(out).process(:index)

      expect(out).to eq(%i[before index after])
    end
  end
end