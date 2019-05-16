require 'test_helper'
class MockModel < ObjectRecord
  attr_accessor :name, :family
  def initialize(name, family)
    @name = name
    @family = family
  end
end

class ErrorCheckingModel < ObjectRecord; end

class ObjectRecordTest < Minitest::Test
  def setup
    @mock_model_first = MockModel.new('Ali', 'Deishid')
    @mock_model_first.save
  end

  def test_save
    assert MockModel.all.include? @mock_model_first
  end

  def test_find_by
    assert_equal MockModel.find_by(name: 'Ali', created_at: Time.now).first.name, 'Ali'
    assert_equal MockModel.find_by(name: 'None'), []
  end

  def test_first
    @mock_model_second = MockModel.new('Ghazal', 'Mim')
    @mock_model_second.save
    assert_equal MockModel.first, MockModel.all[0], "First: #{MockModel.first}, All: #{MockModel.all}"
  end

  def test_delete_all
    @mock_model = MockModel.new('Jack', 'Jones')
    @mock_model.save
    MockModel.delete_all
    assert_equal MockModel.all, []
  end

  def test_find_by_error
    assert_raises Errors::ObjectRecord::ModelError do
      ErrorCheckingModel.find_by name: 'test'
    end
  end

  def test_find_error
    assert_raises NoMethodError do
      Models::Book.find Models::Book.class, title: 'test'
    end
  end

  def teardown
    MockModel.delete_all
  end
end
