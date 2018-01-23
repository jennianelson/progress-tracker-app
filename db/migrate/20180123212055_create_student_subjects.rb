class CreateStudentSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :student_subjects do |t|
      t.integer :subject_id
      t.integer :user_id
      t.timestamps
    end
  end
end
