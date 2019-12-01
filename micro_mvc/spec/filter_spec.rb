require_relative '../impl/controller/application_controller'

class FilterTestController < ApplicationController
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

describe 'Filter' do
  describe '.before_action' do
    it 'executes code before the index action' do
      out = []
      FilterTestController.new(out).process(:index)

      expect(out).to eq(%i[before index])
    end
  end
end