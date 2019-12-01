require 'pry'

module Filters
  def self.included(base)
    base.extend ClassMethods
  end

  # (Future) class methods of ActionController::Base

  module ClassMethods
    def before_action(method)
      before_actions << method
    end

    def before_actions
      @before_actions ||= []
    end
  end

  # instance methods of Filters

  def process(action)
    self.class.before_actions.each { |method| send method }
    super
  end
end
