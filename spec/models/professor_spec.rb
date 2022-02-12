require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  it '#average_student_age' do
    prof1 = Professor.create!(name: "Snape", age: 55, specialty: "Dark")
    stud1 = prof1.students.create!(name: "Neville", age: 15, house: "Hufflepuff")
    stud2 = prof1.students.create!(name: "Hermione", age: 15, house: "Ravenclaw")
    stud3 = prof1.students.create!(name: "Harry", age: 10, house: "Hugglepuff")

    expect(prof1.average_student_age).to eq(13.3)
  end
end
