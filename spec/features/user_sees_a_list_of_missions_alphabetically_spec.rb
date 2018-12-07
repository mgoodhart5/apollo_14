describe 'When I visit /astronauts' do
  it "should see alist of astronauts" do
      astronaut_1 = Astronaut.create(name: "astronaut_1", age: 35, job: "Captain")
      astronaut_2 = Astronaut.create(name: "astronaut_2", age: 45, job: "Engineer")
      mission_1 = Mission.create(title: "Apollo 13", time_in_space: "5 years")
      mission_2 = Mission.create(title: "Mars Voyager", time_in_space: "3 years")
      mission_3 = Mission.create(title: "Deathstar", time_in_space: "2 years")
      mission_4 = Mission.create(title: "Orion 5", time_in_space: "6 years")
      astronaut_mission_1 = AstronautMission.create(astronaut_id: astronaut_1, mission_id: mission_1)
      astronaut_mission_2 = AstronautMission.create(astronaut_id: astronaut_1, mission_id: mission_2)
      astronaut_mission_3 = AstronautMission.create(astronaut_id: astronaut_2, mission_id: mission_3)
      astronaut_mission_4 = AstronautMission.create(astronaut_id: astronaut_2, mission_id: mission_4)

      visit '/astronauts'

      save_and_open_page
      
      within "#astronaut-#{astronaut_1.id}" do
        expect(page).to have_content(astronaut_1.name)
        expect(page).to have_content(mission_1.title)
        expect(page).to have_content(mission_2.title)
        expect(page).not_to have_content(mission_3.title)
        expect(page).not_to have_content(mission_4.title)
      end

      within "#astronaut-#{astronaut_1.id}" do
        expect(page).to have_content(astronaut_2.name)
        expect(page).to have_content(mission_3.title)
        expect(page).to have_content(mission_4.title)
        expect(page).not_to have_content(mission_1.title)
        expect(page).not_to have_content(mission_2.title)
      end
  end
end
