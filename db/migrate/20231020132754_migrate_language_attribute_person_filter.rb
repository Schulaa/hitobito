class MigrateLanguageAttributePersonFilter < ActiveRecord::Migration[6.1]
  def up 
    PersonFilter.find_each do |person_filter|
      language_attribute_args = person_filter.filter_chain[:attributes]&.args&.values&.filter do |filter_args|
        filter_args[:key] == 'years'
      end
      
      next if language_attribute_args.none?
    end
  end
end
