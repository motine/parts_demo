# Represents an organization. This is a first class citizen and belongs in core
class Organization < ApplicationRecord
  validates :name, presence: true
end
