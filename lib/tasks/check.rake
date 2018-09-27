require 'json'
require 'English'

namespace :check do
  ALLOWED_DUPLICATE_SUBPATHS_IN_PARTS = ['routes.rb', 'seeds.rb'].freeze

  task :parts do
    # parts = Dir[Rails.root.join(*', base: Rails.root.join('parts')]
    part_paths = Dir[Rails.root.join('parts', '*')]

    # check for directories which should not be there in a part app
    abort('The app directory is not allowed. Please see the parts folder.') if Dir.exist?(Rails.root.join('app'))
    abort('The db/migrate directory is not allowed. Please see the parts folder.') if Dir.exist?(Rails.root.join('db', 'migrate'))
    abort('The spec directory is not allowed. Please see the parts folder.') if Dir.exist?(Rails.root.join('spec'))

    # check if there are files in the same sub-path under parts
    sub_paths = sub_path_to_parts(part_paths, ALLOWED_DUPLICATE_SUBPATHS_IN_PARTS)
    duplicates = sub_paths.select { |_, using_parts| using_parts.size > 1 }
    abort("You have the same file path under two parts:\n#{duplicates.collect { |path, parts| "#{path} in #{parts.join(', ')}" }.join("\n")}") if duplicates.any?
  end

  # --- helper methods

  # looks in all parts and retrieves the list of sub-paths.
  # returns the mapping of the sub-paths to the part(s) using it: { 'some_sub_path' => ['part_using_it'], ... }
  # Example file structure:
  #   /parts/core/sausage.rb
  #   /parts/core/fish.rb
  #   /parts/interview/sausage.abc
  #   /parts/interview/cheese.abc
  # Will yield:
  #   { 'sausage.rb' => ['core', 'interview'],
  #     'fish.rb' => ['core'],
  #     'cheese.rb' => ['interview'] }
  def sub_path_to_parts(part_paths, ignore_list=[])
    part_paths.reduce({}) do |acc, part_path|
      part_name = File.basename(part_path)
      Dir[File.join('**', '*'), base: part_path].each do |sub_path|
        full_path = File.join(part_path, sub_path)
        next unless File.file?(full_path)
        next if ignore_list.include?(sub_path)
        acc[sub_path] ||= []
        acc[sub_path] << part_name
      end
      acc
    end
  end
end
