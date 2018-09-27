# Be sure to restart your server when you modify this file.

Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w[*.png *.jpg *.gif *.svg]
Rails.application.config.assets.precompile += %w[*.eot *.woff *.woff2 *.otf *.ttf]

# core
# application (application.js and application.css is implicitly added by rails)
Rails.application.config.assets.precompile += %w[banana.css]
