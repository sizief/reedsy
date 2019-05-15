require 'test_helper'
class MockModel < ObjectRecord
  attr_accessor :name, :family
  def initialize name, family
    @name = name
    @family = family
  end
end

class ObjectRecordTest < Minitest::Test
  def setup
    @mock_model_first = MockModel.new('Ali', 'Deishid')
    @mock_model_first.save
  end

  def test_save
    assert MockModel.all.include? @mock_model_first
  end
  
  def test_find_by
    assert !MockModel.find_by(:name, 'Ali').empty?
    assert_equal MockModel.find_by(:name, 'None'), []
  end
  
  def test_first
    @mock_model_second = MockModel.new('Ghazal', 'Mim')
    @mock_model_second.save
    assert_equal MockModel.first, (MockModel.all[0]), "First: #{MockModel.first}, All: #{MockModel.all}"
  end
end
