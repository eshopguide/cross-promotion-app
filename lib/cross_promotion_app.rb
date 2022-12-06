# frozen_string_literal: true

require 'cross_promotion_app/engine'
require 'cross_promotion_app/railtie'
require 'cross_promotion_app/version'
require 'importmap-rails'

module CrossPromotionApp
  class << self
    attr_accessor :configuration
  end

  class Configuration
    attr_accessor :importmap

    def initialize
      @importmap = Importmap::Map.new
    end
  end

  def self.init_config
    self.configuration ||= Configuration.new
  end

  def self.configure
    init_config
    yield(configuration)
  end
end

CrossPromotionApp.init_config
