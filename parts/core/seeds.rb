SeedManager.seeds_for(:base) do
  Organization.create!(name: 'Default Organization')
end

SeedManager.seeds_for(:test_data) do
  Organization.create!(name: 'Test Org 1')
  Organization.create!(name: 'Test Org 2')
  Organization.create!(name: 'Test Org 3')
  Organization.create!(name: 'Test Org 4')
end
