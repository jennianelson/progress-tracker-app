class CreateStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :standards do |t|
      t.string :description
      t.integer :section_id
      t.timestamps
    end
  end
end
