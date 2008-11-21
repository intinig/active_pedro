require 'test/unit'
require File.join(File.dirname(__FILE__), '../lib/active_pedro')
require File.join(File.dirname(__FILE__), 'test_helper')

class TestActivePedroConfiguration < Test::Unit::TestCase
  include TestHelper
  
  def test_should_get_configuration_info
    c = ActivePedro::Configuration.new
    assert_equal 'localhost', c.hostname
    assert_equal 5984, c.port
  end
  
  def test_should_get_configuration_defaults
    ActivePedro::Configuration.configuration_file = File.join(File.dirname(__FILE__), 'fixtures/false_configuration.yml')
    c = ActivePedro::Configuration.new
    assert_equal 'localhost', c.hostname
    assert_equal 5984, c.port    
    ActivePedro::Configuration.configuration_file = ActivePedro::Configuration.default_configuration_file
  end
end