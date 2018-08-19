class StudentSubjectSerializer < ActiveModel::Serializer
  attributes :id, :subject_id, :user_id

  belongs_to :subject
  belongs_to :user
end
