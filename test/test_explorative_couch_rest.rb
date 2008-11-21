require 'test/unit'
require 'rubygems'
require 'couchrest'
require File.join(File.dirname(__FILE__), 'test_helper')

# requires running couchDB on port 5984
class TestExplorativeCouchRest < Test::Unit::TestCase
  include TestHelper
  
  def setup
    @config = YAML::load(File.read(File.join(File.dirname(__FILE__), '../conf/couchdb.yml')))
  end
  
  def test_correct_configuration_is_read
    assert_equal "localhost", @config["development"]["hostname"]
    assert_equal 5984, @config["development"]["port"]
  end
  
  def test_explore_couch_rest_db_creation_and_simple_record_put
    couch_db_url = "http://#{@config["development"]["hostname"]}:#{@config["development"]["port"]}"
    @db = CouchRest.database!("#{couch_db_url}/couchrest-test")
    response = @db.save({:key => 'value', 'another key' => 'another value'})
    assert response["ok"]
    assert_equal "value", @db.get(response['id'])["key"]
  end
end