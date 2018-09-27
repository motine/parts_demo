Rails.application.config.generators do |g|
  g.assets false
  g.helper false
  g.orm :active_record
  g.test_framework :rspec
  g.helper_specs false
  g.controller_specs false
  g.view_specs false
  g.routing_specs false
  g.request_specs false
  g.javascripts false
  g.stylesheets false
  g.stylesheet_engine :scss
  g.scaffold_stylesheet false
  g.template_engine :haml
end
