require_relative 'errors/object_record/model_error'

# A storage for storing object states
# Inherit from this class would be enough to be able to save objects
# and fetch them later
class ObjectRecord
  @store = {}

  class << self
    attr_reader :store
  end

  # Returns array of SELF objects that meets the condition
  def self.find_by(attribute, value)
    model = name.to_sym
    result = []
    ObjectRecord.store[model].each do |object|
      result << object if object.instance_variable_get("@#{attribute}".to_sym) == value
    end
    result
  rescue StandardError
    raise Errors::ObjectRecord::ModelError
  end

  # Returns list of all objects of caller's class
  def self.all
    model = name.to_sym
    ObjectRecord.store[model]
  end

  # Delete all objects of caller's class
  def self.delete_all
    model = name.to_sym
    ObjectRecord.new.initialize_model_record model
  end

  def self.first
    model = name.to_sym
    return nil if ObjectRecord.store[model].nil?
    ObjectRecord.store[model][0]
  end

  def save
    model = self.class.name.to_sym
    initialize_model_record model if ObjectRecord.store[model].nil?
    ObjectRecord.store[model] << self
  end

  def initialize_model_record(model)
    ObjectRecord.store[model] = []
  end
end
