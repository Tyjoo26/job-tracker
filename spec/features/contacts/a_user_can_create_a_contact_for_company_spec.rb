require 'rails_helper'

describe "When the user visits the page for a specific Company, theres a form to enter a contact" do
  before :each do
    @company = Company.create!(name: "ESPN")

    visit company_path(@company)
  end

    scenario "user visits specific company, sees form for adding contact, can add contact successfully and be redirected to specific company with contact content populating page" do

      expect(page).to have_content("ESPN")
      fill_in "contact[full_name]", with: "Jerry Rice"
      fill_in "contact[position]", with: "The GOAT"
      fill_in "contact[email]", with: "GOAT@espn.com"
      fill_in "contact[company]", with: "ESPN"

      click_link("Submit")
      expect(current_path).to eq(visit company_path(@company))

      expect(page).to have_content("Jerry Rice")
      expect(page).to have_content("The GOAT")
      expect(page).to have_content("GOAT@espn.com")
    end
  end
