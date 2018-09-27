# This class contains defaults for _all_ records in the system.
# Each record should derive from this class.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
