class AddSubjectIdToStandards < ActiveRecord::Migration[5.1]
  def change
    add_column :standards, :subject_id, :integer
  end
end
