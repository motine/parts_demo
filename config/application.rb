require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Parts
  # This is the main application.
  class Application < Rails::Application
    config.load_defaults 5.2

    # enable parts instead of app
    config.autoload_paths += Dir[Rails.root.join('parts', '*', '*')].sort unless %w[staging production].include? Rails.env
    config.eager_load_paths += Dir[Rails.root.join('parts', '*', '*')].sort.reject { |f| f[%r{/migrate$}] || f[%r{/spec$}] || f[%r{/seeds.rb}] }

    # more paths include: 'app', 'lib', 'lib/tasks', 'config', 'config/initializers', 'config/locales'
    paths['app/controllers'].concat(Dir[File.join('parts', '*', 'controllers')].sort)
    paths['app/helpers'].concat(Dir[File.join('parts', '*', 'helpers')].sort)
    paths['app/models'].concat(Dir[File.join('parts', '*', 'models')].sort)
    paths['app/views'].concat(Dir[File.join('parts', '*', 'views')].sort)
    paths['db/migrate'].concat(Dir[File.join('parts', '*', 'migrate')].sort)
    paths['config/routes.rb'].concat(Dir[File.join('parts', '*', 'routes.rb')].sort)

    config.assets.paths += Dir[Rails.root.join('parts', '*', 'assets', '*')].sort
  end
end
