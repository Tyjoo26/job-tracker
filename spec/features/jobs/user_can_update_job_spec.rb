require 'rails_helper'


describe 'User can edit /companies/id/jobs/id/edit' do
  before :each do
    company = Company.create!(name: "Turing School")
    job = Job.create!(title: "Teaching Assistant", level_of_interest: 56, company: company.id, city: "Denver", company_id: company.id)

    visit edit_company_job_path(company,job)
  end

  scenario 'a user sees all jobs for a company and can update a job' do

    expect(page).to have_content("Turing School")

    fill_in('job[title]', with: "Teach g0d")
    fill_in('job[description]', with: "God of Turing")
    fill_in('job[level_of_interest]', with: 88)
    fill_in('job[city]', with: "Man Jose")

    click_button("Submit")
    expect(current_path).to eq(company_job_path(job))

  end
end
