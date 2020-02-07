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
  end
end
