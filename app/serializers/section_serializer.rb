class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :subject_id

  belongs_to :subject
end
