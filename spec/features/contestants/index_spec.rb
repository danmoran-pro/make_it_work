require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit a contestant's show page" do
    it "I see a list of all contestants and thier project." do
        challenge_1 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1500)

        project_1 = challenge_1.projects.create!(name: "Litfit", material: "Lamp Shade")
        project_2 = challenge_1.projects.create!(name: "Rug Tuxedo", material: "Rug")
        project_3 = challenge_1.projects.create!(name: "LeatherFeather", material: "Leather")

        contestant_1 = Contestant.create!(name: "Kentaro Kameyama", age: 25, hometown: "Denver", years_of_experience: 5 )
        contestant_2 = Contestant.create!(name: "Jay McCarroll", age: 25, hometown: "NYC", years_of_experience: 10 )

        
        contestant_1.projects << project_1 
        contestant_1.projects << project_2
        contestant_2.projects << project_3

        visit contestants_path

        within("#contestant-#{contestant_1.id}") do
        expect(page).to have_content(contestant_1.name)
        expect(page).to have_content(project_1.name)
        expect(page).to have_content(project_2.name)
        end 

        within("#contestant-#{contestant_2.id}") do
        expect(page).to have_content(contestant_2.name)
        expect(page).to have_content(project_3.name)
        end 
    end 
  end 
end  