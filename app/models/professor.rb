class Professor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :specialty

  has_many :professor_students
  has_many :students, through: :professor_students

  def average_student_age
    students.average(:age).round(1)
  end
end
