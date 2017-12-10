require 'rails_helper'

describe "As a user" do
  describe 'I see a form for updating a job' do
    before :each do
      @company = Company.create!(name: "ESPN")
      @job = @company.jobs.create!(title: "Developer", description: "So hot right now...so hot", level_of_interest: 70, city: "Denver")

      visit edit_company_job_path(@company, @job)
    end

    it 'has form fields and a submit button will redirect me to job index' do
      fill_in "job[title]", with: "Developer"
      fill_in "job[description]", with: "So fun!"
      fill_in "job[level_of_interest]", with: 80
      fill_in "job[city]", with: "Denver"

      click_button "Submit"

      expect(current_path).to eq("/companies/#{@company.id}/jobs/#{@job.id}")

      expect(page).to have_content(80)
    end
  end
end
