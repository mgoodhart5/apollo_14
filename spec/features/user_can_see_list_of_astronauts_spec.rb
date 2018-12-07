require 'rails_helper'

describe 'When I visit /astronauts' do
  it "should see alist of astronauts" do
    astronaut_1 = Astronaut.create(name: "astronaut_1", age: 35, job: "Captain")
    astronaut_2 = Astronaut.create(name: "astronaut_2", age: 45, job: "Engineer")
    astronaut_3 = Astronaut.create(name: "astronaut_3", age: 55, job: "Doctor")

    visit '/astronauts'

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
    expect(page).to have_content(astronaut_3.name)
    expect(page).to have_content(astronaut_3.age)
    expect(page).to have_content(astronaut_3.job)
  end
  it "should see the average age of all astronauts." do
    astronaut_1 = Astronaut.create(name: "astronaut_1", age: 35, job: "Captain")
    astronaut_2 = Astronaut.create(name: "astronaut_2", age: 45, job: "Engineer")
    average_age = 40

    visit '/astronauts'

    expect(page).to have_content("Average Age: #{average_age}")
  end
end
