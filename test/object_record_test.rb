require 'test_helper'

class MockModel < ObjectRecord
  attr_accessor :name, :family
  def initialize(args)
    @name = args[:name]
    @family = args[:family]
  end
end

class EmptyCheckingModel < ObjectRecord; end

class ObjectRecordTest < Minitest::Test
  def setup
    @mock_model_first = MockModel.new(name: 'Ali', family: 'Deishid')
    @mock_model_first.save
  end

  def test_save
    assert MockModel.all.include? @mock_model_first
  end

  def test_find_by
    assert_equal MockModel.find_by(name: 'Ali').first.name, 'Ali'
    assert_equal MockModel.find_by(name: 'None'), []
  end

  def test_first
    @mock_model_second = MockModel.new(name: 'Ghazal', family: 'Mim')
    @mock_model_second.save
    assert_equal MockModel.first, MockModel.all[0], "First: #{MockModel.first}, All: #{MockModel.all}"
  end

  def test_delete_all
    @mock_model = MockModel.new(name: 'Jack', family: 'Jones')
    @mock_model.save
    MockModel.delete_all
    assert_equal MockModel.all, []
  end

  def test_find_by_empty_error
    assert_equal EmptyCheckingModel.find_by(name: 'test'), []
  end

  def test_find_error
    assert_raises NoMethodError do
      Models::Book.find Models::Book.class, title: 'test'
    end
  end

  def test_are_conditions_true?
    @test_obj = MockModel.new(name: 'ali', family: 'Deishidi')
    assert !MockModel.send(:are_conditions_true?, @test_obj, name: 'ali', family: 'something else')
    assert MockModel.send(:are_conditions_true?, @test_obj, name: 'ali', family: 'Deishidi')
  end

  def teardown
    MockModel.delete_all
  end
end
