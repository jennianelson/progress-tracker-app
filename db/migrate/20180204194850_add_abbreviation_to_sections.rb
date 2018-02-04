class AddAbbreviationToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :abbreviation, :string
  end
end
