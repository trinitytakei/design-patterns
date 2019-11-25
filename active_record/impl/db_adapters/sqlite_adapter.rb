class SqliteAdapter
  def initialize
    require 'sqlite3'
    @db = SQLite3::Database.new(db_location, results_as_hash: true)
  end

  def execute(sql)
    @db.execute(sql).each do |row|
      row.transform_keys!{|key|key.to_sym}
    end
  end

  def columns(table_name)
    @db.table_info(table_name).map{|row|row["name"].to_sym}
  end

private

  def db_location
    "#{File.dirname(__FILE__)}/../db/database.db"
  end
end