# This wil fix issues with the pluralizations from models.
# e.g. JobPosting.model_name.human.pluralize will be now "Stellenanzeigen" instead of "Stellenanzeiges" (which is wrong)
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'Bewerbung', 'Bewerbungen'
  inflect.irregular 'Stellenanzeige', 'Stellenanzeigen'
end
