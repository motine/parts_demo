# This class manages can load the seed files in the individual parts and run them
# Use them like so:
#   # somepart/seeds.rb
#   SeedManager.seeds_for(:base) do
#     Company.create(name: "Fish")
#   end
class SeedManager
  @blocks = { base: [], test_data: [] }

  def initialize
    # load all seeds, so they can use the methods base_seeds and test_data_seeds
    Dir[Rails.root.join('parts', '*', 'seeds.rb')].each do |f|
      require f
    end
  end

  def seed(base_or_test_data=:base)
    self.class.blocks[base_or_test_data].each(&:call)
  end

  def self.blocks
    return @blocks
  end

  def self.seeds_for(base_or_test_data=:base, &block)
    @blocks[base_or_test_data] << block
  end
end
