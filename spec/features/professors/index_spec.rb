require 'rails_helper'

describe 'professor index page' do
  it 'displays all professors and their information' do
    professor1 = Professor.create!(name: "prof 1", age: 50, specialty: "first thing")
    professor2 = Professor.create!(name: "prof 2", age: 55, specialty: "second thing")

    visit '/professors'

    expect(page).to have_content("Name: #{professor1.name}")
    expect(page).to have_content("Age: #{professor1.age}")
    expect(page).to have_content("Specialty: #{professor1.specialty}")
    expect(page).to have_content("Name: #{professor2.name}")
    expect(page).to have_content("Age: #{professor2.age}")
    expect(page).to have_content("Specialty: #{professor2.specialty}")
  end
end
