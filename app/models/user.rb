class User < ApplicationRecord
  has_many :student_subjects, dependent: :destroy
  has_many :subjects, through: :student_subjects
  has_many :student_standards, dependent: :destroy
  has_many :standards, through: :student_standards
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def add_subjects_and_standards(student_subject)
    student_subject.subject.sections.each do |section|
      section.standards.each do |standard|
          self.student_standards.create(standard_id: standard.id)
      end
    end
  end

  def destroy_student_standards(sections)
    sections.each do |section|
        section.standards.each do |standard|
            standard.student_standards.each do|ss| 
              if ss.user_id == self.id
                ss.destroy
              end
            end
        end
    end
end

end
