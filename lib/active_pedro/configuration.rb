module ActivePedro
  class Configuration
    attr_accessor :hostname, :port
    
    def self.configuration_file
      @@configuration_file ||= default_configuration_file
    end
    
    def self.configuration_file=(filename)
      @@configuration_file = filename
    end
    
    def self.default_configuration_file
      File.join(File.dirname(__FILE__), '../../conf/couchdb.yml')
    end
    
    def initialize
      config = YAML::load(File.read(self.class.configuration_file))
      environment = config[ENV['RAILS_ENV'] || 'development']
      if environment
        @hostname = environment['hostname'] || 'localhost'
        @port = environment['port'] || 5984
      end
    end
  end
end
