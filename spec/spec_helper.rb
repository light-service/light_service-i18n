# frozen_string_literal: true

require "light_service/i18n"
require_relative "support/test_doubles"
require "debug"

I18n.load_path += [File.expand_path('spec/support/en.yml')]
I18n.enforce_available_locales = true

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
