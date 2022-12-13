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
      @importmap = Importmap::Map.new if CrossPromotionApp.use_importmap?
    end
  end

  def self.init_config
    self.configuration ||= Configuration.new
  end

  def self.configure
    init_config
    yield(configuration)
  end

  def self.use_importmap?
    File.exist?('config/importmap.rb')
  end

  def self.use_webpacker?
    defined?(Webpacker) == 'constant'
  end

  def self.webpacker
    return unless CrossPromotionApp.use_webpacker?

    @webpacker ||= ::Webpacker::Instance.new(
      root_path: CrossPromotionApp::Engine.root,
      config_path: CrossPromotionApp::Engine.root.join('config', 'webpacker.yml')
    )
  end
end

CrossPromotionApp.init_config
