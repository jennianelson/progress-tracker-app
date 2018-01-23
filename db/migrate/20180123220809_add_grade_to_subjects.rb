class AddGradeToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :grade, :string
  end
end
