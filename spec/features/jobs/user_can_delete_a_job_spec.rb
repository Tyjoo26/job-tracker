require 'rails_helper'


describe 'User can delete a job' do
  before :each do
    company = Company.create(name: "MTV")
    job = company.jobs.create(title: "Developer", level_of_interest: 80, city: "Denver")


    visit company_jobs_path(job)

  end

  scenario ' a user can delete a job' do
    expect(page.status_code).to eq(200)
    expect(page).to have_content("Delete")

    click_button("Delete")
    expect(current_path).to eq(company_path(company))
  end
end
