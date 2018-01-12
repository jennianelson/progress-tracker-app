class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :description
      t.integer :section_id
      t.timestamps
    end
  end
end
