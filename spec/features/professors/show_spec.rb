require 'rails_helper'

describe 'professor show page' do
  before do
    @prof1 = Professor.create!(name: "Snape", age: 55, specialty: "Dark")
    @stud1 = @prof1.students.create!(name: "Neville", age: 13, house: "Hufflepuff")
    @stud2 = @prof1.students.create!(name: "Hermione", age: 13, house: "Ravenclaw")

    # add edge case for other prof student if have time
  end

  it 'displays the professors students' do
    visit "/professors/#{@prof1.id}"

    expect(page).to have_content("#{@prof1.name} students")
    expect(page).to have_content(@stud1.name)
    expect(page).to have_content(@stud2.name)
  end
end
