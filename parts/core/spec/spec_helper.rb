def pattern
  if ARGV[0].nil? || ARGV[0] == '-t'
    'parts/*/spec/*/*_spec.rb, lib/spec/**/*_spec.rb'
  else
    ARGV[0]
  end
end

RSpec.configure do |config|
  config.pattern = pattern
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
