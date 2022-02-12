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
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

    @stud1 = @hagarid.students.create!(name: "Student 1", age: 12, house: "Hufflepuff")
    @stud_prof = ProfessorStudent.create!(professor: @snape, student: @stud1)

    expect(@stud1.prof_count).to eq(2)
  end
end
