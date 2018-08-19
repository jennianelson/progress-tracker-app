class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :set_id, :ready, :sections

  # has_many :student_subjects
  has_many :sections
  # has_many :standards
end
