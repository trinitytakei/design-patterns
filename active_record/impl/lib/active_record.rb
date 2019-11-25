require_relative '../db_adapters/sqlite_adapter.rb'

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(name, *args, &block)
      columns = @@connection.columns("tasks")

      if(columns.include?(name))
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      # to_i -> primitive defense agains Mr. Bobby Tables
      new find_by_sql("SELECT * FROM tasks WHERE id=#{id.to_i} LIMIT 1").first
    end

    def self.find_by_sql(sql)
      @@connection.execute(sql)
    end
  end

  private

    attr_reader :attributes
end