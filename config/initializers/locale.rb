I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')].sort
I18n.load_path += Dir[Rails.root.join('parts', '*', 'locales', '**', '*.{rb,yml}')].sort

# Whitelist locales available for the application
I18n.available_locales = %i[de en]

I18n.default_locale = :de
