SeedManager.seeds_for(:base) do
  Plant.create(position: 1)
end

SeedManager.seeds_for(:test_data) do
  Plant.create(position: 2)
  Plant.create(position: 3)
  Plant.create(position: 4)
  Plant.create(position: 5)
  Plant.create(position: 6)
end
