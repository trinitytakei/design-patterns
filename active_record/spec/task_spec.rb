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
end
