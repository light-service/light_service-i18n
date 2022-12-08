# frozen_string_literal: true

RSpec.describe LightService::I18n do
  it "has a version number" do
    expect(LightService::I18n::VERSION).not_to be nil
  end
end

RSpec.describe LightService::Configuration do
  before do
    ::I18n.available_locales = %i[en it]
    LightService::Configuration.locale = :en
    ::I18n.locale = :en
  end

  context '.locale=' do
    it 'is patched in order to keep in sync I18n' do
      aggregate_failures do
        expect { described_class.locale = :it }
          .to change { ::I18n.locale }
          .from(:en)
          .to(:it)

        expect(::I18n.locale).to eq(LightService::Configuration.locale)
      end
    end
  end
end

RSpec.describe ::I18n do
  before do
    ::I18n.available_locales = %i[en it]
    LightService::Configuration.locale = :en
    ::I18n.locale = :en
  end

  context '.locale=' do
    it 'is patched in order to keep in sync LS config' do
      aggregate_failures do
        expect { described_class.locale = :it }
          .to change { LightService::Configuration.locale }
          .from(:en)
          .to(:it)

        expect(::I18n.locale).to eq(LightService::Configuration.locale)
      end
    end
  end
end
