require 'rubygems'
require 'couchrest'
require File.join(File.dirname(__FILE__), 'active_pedro/configuration')

module ActivePedro
  def self.const_missing(const)
    ensure_configuration_is_loaded
    klass = load_class(const)
    if klass
      return klass
    else
      raise NameError, "#{const} is not an ActivePedro class"
    end
  end
  
  def self.load_class(klass)
    return false
    class_eval "#{const} = Class.new"    
  end
  
  protected
  def self.ensure_configuration_is_loaded
    @configuration ||= Configuration.new
  end
end
