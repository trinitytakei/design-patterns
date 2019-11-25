# frozen_string_literal: true

require_relative '../db_adapters/sqlite_adapter.rb'

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(method_name, *args, &block)
      if columns.include?(method_name)
        @attributes[method_name]
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      columns.include?(method_name) || super
    end

    def self.find(id)
      # to_i -> primitive defense agains Mr. Bobby Tables
      new find_by_sql("SELECT * FROM tasks WHERE id=#{id.to_i} LIMIT 1").first
    end

    def self.find_by_sql(sql)
      @@connection.execute(sql)
    end

    private

    def columns
      @@connection.columns('tasks')
    end

    attr_reader :attributes
  end
end
