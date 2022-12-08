# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.tag = 'LightService::I18n'
loader.inflector = Zeitwerk::GemInflector.new(__FILE__)
loader.push_dir(__dir__, :namespace => LightService)
loader.setup

require 'light-service'
require 'i18n'

module LightService
  module I18n; end
end

LightService::Configuration.localization_adapter = LightService::I18n::LocalizationAdapter.new

LightService::Configuration.singleton_class.prepend(
  Module.new do
    def locale=(locale)
      ::I18n.config.instance_variable_set(:@locale, locale)
      super(locale)
    end
  end
)

::I18n.singleton_class.prepend(
  Module.new do
    def locale=(locale)
      LightService::Configuration.instance_variable_set(:@locale, locale)
      super(locale)
    end
  end
)
