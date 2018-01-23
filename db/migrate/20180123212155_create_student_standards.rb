class CreateStudentStandards < ActiveRecord::Migration[5.1]
  def change
    create_table :student_standards do |t|
      t.integer :standard_id
      t.integer :user_id
      t.integer :progress_level
      t.text :evidence
      t.text :comments
      
      t.timestamps
    end
  end
end
