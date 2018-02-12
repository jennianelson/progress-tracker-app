class User < ApplicationRecord
  enum role: [:student, :teacher, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :student_subjects, dependent: :destroy
  has_many :subjects, through: :student_subjects
  has_many :student_standards, dependent: :destroy
  has_many :standards, through: :student_standards

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def set_default_role
    self.role ||= :student
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def add_subject_and_standards(subject)
    self.subjects << subject
    self.standards << subject.standards
  end


end
