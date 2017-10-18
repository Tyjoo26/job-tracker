require 'rails_helper'

describe 'user sees a job and can enter a comment' do
  before :each do
    @company = Company.create!(name: "MTV")
    @category = Category.create!(title: "HR")
    @job = Job.create(title: "Developer", level_of_interest: 80, city: "Denver", company: @company, category: @category)


    visit company_job_path(@company,@job)
  end


  it 'user can submit new comment in form field and page redirects to jobs with all comments' do
    fill_in "comment[body]", with: "ASDF"
    click_button("Submit")
    expect(current_path).to eq("/jobs/#{@job.id}/comments/#{@job.comment_id}")
  end

end
