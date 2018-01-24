class AddSubheadingToStandards < ActiveRecord::Migration[5.1]
  def change
    add_column :standards, :subheading, :string
  end
end
