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

    def after_action(method)
      after_actions << method
    end

    def around_action(method)
      around_actions << method
    end

    def before_actions
      @before_actions ||= []
    end

    def after_actions
      @after_actions ||= []
    end

    def around_actions
      @around_actions ||= []
    end
  end

  # instance methods of Filters

  def process(action)
    self.class.before_actions.each { |method| send method }
    super
    self.class.after_actions.each { |method| send method }
  end
end
