class AddSetIdToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :set_id, :string
  end
end
