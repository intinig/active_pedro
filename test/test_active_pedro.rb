require 'test/unit'
require File.join(File.dirname(__FILE__), '../lib/active_pedro')
require File.join(File.dirname(__FILE__), 'test_helper')

class TestActivePedro < Test::Unit::TestCase
  include TestHelper
  
  def test_should_not_create_class_on_the_fly_if_it_doesnt_exist_in_couch_db
    begin
      ActivePedro::StrangeClassThatIsMissing.new
    rescue NameError => e
      assert e.message.match(/is not an ActivePedro class/)
    end
  end
    
  # def test_should_create_a_class_if_it_exists_in_couchdb
  #   flunk "Yet to implement."
  # end
  
end