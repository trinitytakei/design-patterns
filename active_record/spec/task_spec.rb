# frozen_string_literal: true

require_relative '../usage/models/task.rb'

describe Task do
  describe '#initialize' do
    it 'initializes object with id and name' do
      task = Task.new(id: 1, name: 'Buy milk')

      expect(task.id).to eq 1
      expect(task.name).to eq 'Buy milk'
    end
  end

  describe '.find' do
    it 'returns the record based on ID' do
      task = Task.find(1)

      expect(task.id).to eq 1
    end
  end

  describe '.table_name' do
    it 'returns the table name (pluralized model name)' do
      expect(Task.table_name).to eq 'tasks'
    end
  end

  describe '.all' do
    it 'returns all tasks in the database' do
      all_tasks = Task.all

      expect(all_tasks.size).to eq(4)
      expect(all_tasks.map(&:class).uniq).to eq([Task])
      expect(all_tasks.map(&:id)).to eq([1, 2, 3, 4])
    end
  end
end
