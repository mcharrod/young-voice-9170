require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  it '#prof_count' do
    @prof1 = Professor.create!(name: "Professor", age: 50, specialty: "magic")
    @prof2 = Professor.create!(name: "Professor 2", age: 56, specialty: "magic again")

    @stud1 = @prof1.students.create!(name: "Student 1", age: 12, house: "Hufflepuff")
    @stud_prof = ProfessorStudent.create!(professor: @prof2, student: @stud1)

    expect(@stud1.prof_count).to eq(2)
  end
end
