require 'rails_helper'

describe 'professor index page' do
  it 'displays all professors and their information' do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

    visit '/professors'

    expect(page).to have_content("Name: #{snape.name}")
    expect(page).to have_content("Age: #{snape.age}")
    expect(page).to have_content("Specialty: #{snape.specialty}")
    expect(page).to have_content("Name: #{hagarid.name}")
    expect(page).to have_content("Age: #{hagarid.age}")
    expect(page).to have_content("Specialty: #{hagarid.specialty}")
  end
end
