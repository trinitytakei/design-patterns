# frozen_string_literal: true

require 'active_model'
require_relative '../db_adapters/sqlite_adapter.rb'

require 'pry'

module ActiveRecord
  class Base
    include ActiveModel::Validations

    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def method_missing(method_name, *args, &block)
      valid_column_name?(method_name) ? attributes[method_name] : super
    end

    def respond_to_missing?(method_name, include_private = false)
      valid_column_name?(method_name) || super
    end

    def self.find(id)
      # to_i -> defense against Mr. Bobby Tables
      find_by_sql("SELECT * FROM #{table_name} WHERE id=#{id.to_i} LIMIT 1").first
    end

    def self.all
      find_by_sql("SELECT * FROM #{table_name}")
    end

    def self.find_by_sql(sql)
      [*@@connection.execute(sql)]
        .map { |record| new record }
    end

    def self.table_name
      "#{name.downcase}s"
    end

    private

    def valid_column_name?(potential_column_name)
      columns.include?(potential_column_name)
    end

    def columns
      @@connection.columns(self.class.table_name)
    end

    attr_reader :attributes
  end
end
