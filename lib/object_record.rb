require_relative './errors/object_record/model_error'
require_relative './logging'
# A storage for storing object states
# Inherit from this class would be enough to be able to save objects
# and fetch them later
class ObjectRecord
  extend Logging
  attr_accessor :created_at
  @store = {}

  class << self
    attr_reader :store
  end

  # Returns array of SELF objects that meets the condition
  def self.find_by(conditions)
    model = name.to_sym
    raise Errors::ObjectRecord::ModelError if ObjectRecord.store[model].nil?
    find model, conditions
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
    self.created_at = Time.now
    initialize_model_record model if ObjectRecord.store[model].nil?
    ObjectRecord.store[model] << self
  end

  def initialize_model_record(model)
    ObjectRecord.store[model] = []
  end

  def self.find(model, conditions)
    result = []
    ObjectRecord.store[model].each do |object|
      result << object if are_conditions_true? object, conditions
    end
    result
  end

  private_class_method :find
  def self.are_conditions_true?(object, conditions)
    res = []
    res = conditions.map do |attr, value|
      next if object.instance_variable_get("@#{attr}").nil?
      if value.is_a? Range
        object.instance_variable_get("@#{attr}") >= value.first &&
          object.instance_variable_get("@#{attr}") <= value.last
      else
        object.instance_variable_get("@#{attr}") == value
      end
    end
    res.flatten.all? true
  end
end
