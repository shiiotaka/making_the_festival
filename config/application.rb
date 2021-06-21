require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MakingTheFestival
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Rails generate設定
    config.generators do |g|
      g.assets         false # CSS,JavaScriptファイルを作成しない
      g.skip_routes    true  # ルーティングを自動生成しない
      g.helper         false # ヘルパーを自動生成しない
      g.test_framework :rspec, # RSpecを使用
                       controller_specs: false, # controller specは作成しない
                       view_specs: false, # view specは作成しない
                       routing_specs: false, # routing specは作成しない
                       helper_specs: false # helper specは作成しない
    end

    # 言語ファイルを階層ごとに設定するためのコード
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # アプリケーションが対応している言語のホワイトリスト
    config.i18n.available_locales = %i[ja en]

    # デフォルトの言語設定
    config.i18n.default_locale = :ja

    # 時間を日本時間に設定
    config.time_zone = 'Tokyo'

    # field_with_errorsによるレイアウト崩れを防ぐ
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }

  end
end
