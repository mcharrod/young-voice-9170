require 'rails_helper'

describe 'student index page' do
  before do
    @prof1 = Professor.create!(name: "teacher 1", age: 60, specialty: "special powers 1")
    @prof2 = Professor.create!(name: "teacher 2", age: 61, specialty: "special powers 2")
    @prof3 = Professor.create!(name: "teacher 3", age: 62, specialty: "special powers 3")

    @stud1 = @prof1.students.create!(name: "Harry", age: 13, house: "Hufflepuff")
    @stud2 = @prof2.students.create!(name: "Hermione", age: 14, house: "Hufflepuff")
    @stud3 = @prof3.students.create!(name: "Ron", age: 15, house: "Hufflepuff")

    @stud_prof = ProfessorStudent.create!(professor: @prof1, student: @stud1)
  end
  it 'displays students names and number of teachers' do
    visit '/students'

    expect(page).to have_content("#{@stud1.name}: 2")
    expect(page).to have_content("#{@stud2.name}: 1")
    expect(page).to have_content("#{@stud3.name}: 1")
  end
end
