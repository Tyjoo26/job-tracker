require 'rails_helper'


describe 'User can delete a job' do
  before :each do
    @company = Company.create!(name: "MTV")
    @category = Category.create!(title: "HR")
    @job = Job.create(title: "Developer", level_of_interest: 80, city: "Denver", company: @company, category: @category)


    visit company_jobs_path(@company,@job)

  end

  scenario ' a user can delete a job' do
    expect(page.status_code).to eq(200)
    expect(page).to have_content("Delete")

    click_link("Delete")
    expect(page).to have_content("Developer was successfully deleted! All Jobs for MTV")
  end
end
