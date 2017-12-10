require 'rails_helper'


describe "As a user" do
  describe "when I go to the job index page" do
    describe "displays a list of jobs with an option to delete a specific job" do
      before :each do
        @company = Company.create!(name: "ESPN")
        @job = @company.jobs.create!(title: "Developer", description: "So hot right now...so hot", level_of_interest: 70, city: "Denver")

        visit company_jobs_path(@company)
      end
      it "deletes the job when I click the delete job, and it displays the index without that job" do
        expect(page).to have_content("Developer")

        click_on("Delete")
        expect(page).to have_no_content("Denver")
      end
    end
  end
end
