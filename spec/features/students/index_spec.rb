require 'rails_helper'

describe 'student index page' do
  before do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @stud1 = @snape.students.create!(name: "Harry", age: 13, house: "Hufflepuff")
    @stud2 = @hagarid.students.create!(name: "Hermione", age: 14, house: "Hufflepuff")
    @stud3 = @lupin.students.create!(name: "Ron", age: 15, house: "Hufflepuff")

    @stud_prof = ProfessorStudent.create!(professor: @snape, student: @stud1)
  end
  it 'displays students names and number of teachers' do
    visit '/students'

    expect(page).to have_content("#{@stud1.name}: 2")
    expect(page).to have_content("#{@stud2.name}: 1")
    expect(page).to have_content("#{@stud3.name}: 1")
  end
end
