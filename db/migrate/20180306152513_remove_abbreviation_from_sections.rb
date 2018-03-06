class RemoveAbbreviationFromSections < ActiveRecord::Migration[5.1]
  def change
    remove_column :sections, :abbreviation, :string
  end
end
