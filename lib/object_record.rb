  class ObjectRecord
    @store = Hash.new
  
    def self.store
      @store
    end

    def self.find_by attribute, value
      model = self.name.to_sym
      result = Array.new
      ObjectRecord.store[model].each do |object|
        result << object if object.instance_variable_get("@#{attribute}".to_sym) == value
      end
      result
    end

  def self.all
    model = self.name.to_sym
    ObjectRecord.store[model]
  end

  def self.first
    model = self.name.to_sym
    return nil if ObjectRecord.store[model].nil?
    ObjectRecord.store[model][0]
  end
  
  
  def save
    model = self.class.name.to_sym
    create_model_record model if ObjectRecord.store[model].nil?
    ObjectRecord.store[model] << self
  end

  private
  
  def create_model_record model
    ObjectRecord.store[model] = Array.new
  end

  end

