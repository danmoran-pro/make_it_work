require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit a project's show page" do
    it "I see that project's name and material" do
        challenge_1 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1500)

        project_1 = challenge_1.projects.create!(name: "Litfit", material: "Lamp Shade")
        
        visit project_path(project_1)

        expect(page).to have_content(project_1.name)  
        expect(page).to have_content(project_1.material)  
        expect(page).to have_content("Apartment Furnishings")  
    end
    
    it "can see a count of the number of contestants on this project" do 
      challenge_1 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1500)

      project_1 = challenge_1.projects.create!(name: "Litfit", material: "Lamp Shade")

      contestant_1 = Contestant.create!(name: "Kentaro Kameyama", age: 25, hometown: "Denver", years_of_experience: 5 )
      contestant_2 = Contestant.create!(name: "Jay McCarroll", age: 25, hometown: "NYC", years_of_experience: 10 )

      project_1.contestants << contestant_1
      project_1.contestants << contestant_2
      
      visit project_path(project_1)
      
      expect(page).to have_content(project_1.name)  
      expect(page).to have_content(project_1.material)  
      expect(page).to have_content("Number of Contestants: 2")
    end   
  end
end
