require 'seed_manager'

namespace :db do
  task seed: :environment do
    SeedManager.new.seed(:base)
  end

  desc "Fill database with seed test data"
  task seed_test_data: :environment do
    SeedManager.new.seed(:test_data)
  end
end
