class AddDotNotationToStandards < ActiveRecord::Migration[5.1]
  def change
    add_column :standards, :dot_notation, :string
  end
end
