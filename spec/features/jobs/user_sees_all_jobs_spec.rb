require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "HR")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", company: company, category: category)


    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")

    click_link("Delete")
    expect(page).to have_content("Developer was successfully deleted! All Jobs for ESPN")
  
  end
end
