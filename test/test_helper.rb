$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'minitest/autorun'
require 'test/unit'

require_relative '../app.rb'
require_relative '../lib/models'
