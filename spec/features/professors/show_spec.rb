require 'rails_helper'

describe 'professor show page' do
  before do
    @prof1 = Professor.create!(name: "Snape", age: 55, specialty: "Dark")
    @stud1 = @prof1.students.create!(name: "Neville", age: 15, house: "Hufflepuff")
    @stud2 = @prof1.students.create!(name: "Hermione", age: 15, house: "Ravenclaw")
    @stud3 = @prof1.students.create!(name: "Harry", age: 10, house: "Hugglepuff")

    @prof2 = Professor.create!(name: "Do not display", age: 1000, specialty: "Invisible")
    @null_stud = @prof2.students.create!(name: "Do not display", age: 10000, house: "Gone")
  end

  it 'displays the professors students' do
    visit "/professors/#{@prof1.id}"

    expect(page).to have_content("#{@prof1.name} students")
    expect(page).to have_content(@stud1.name)
    expect(page).to have_content(@stud2.name)
    expect(page).to have_content(@stud3.name)
  end

  it 'does not display students of other professors' do
    visit "/professors/#{@prof1.id}"

    expect(page).not_to have_content(@null_stud.name)
  end

  it 'displays average age of students in class' do
    visit "/professors/#{@prof1.id}"

    expect(page).to have_content("Average student age: 13.3")
  end
end
