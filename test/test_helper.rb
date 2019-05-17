$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'minitest/autorun'
require 'test/unit'

require_relative '../app.rb'
require_relative '../lib/models'
require_relative '../lib/feed'
require_relative '../lib/object_record'
require_relative '../lib/financial_services'

def reset_object_record
  Models::Author.delete_all
  Models::User.delete_all
  Models::Follow.delete_all
  Models::Upvote.delete_all
  Models::Book.delete_all
end
