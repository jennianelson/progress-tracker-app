class AddStudentSubjectIdToStudentStandards < ActiveRecord::Migration[5.1]
  def change
    add_column :student_standards, :student_subject_id, :integer
  end
end
