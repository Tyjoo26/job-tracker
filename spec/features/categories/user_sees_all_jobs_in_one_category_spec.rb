require 'rails_helper'

describe 'user sees all jobs in a show page for category' do
  before :each do
    @category = Category.create!(title: "Web Development")
    @company = Company.create!(name: "ESPN")
    @job = Job.create!(title: "Developer", description: "Coding", level_of_interest: 99, city: "Man Jose", category: @category, company: @company )
    @job_1= Job.create!(title: "Code Ninja", description: "Who Knows", level_of_interest: 99, city: "Man Francisco", category: @category, company: @company )

    visit category_path(@category)
  end

  it "user sees all jobs associated with specific category" do
    expect(page).to have_content("Developer")
    expect(page).to have_content("Code Ninja")

    click_button("Go Back to All Categories")
    expect(current_path).to eq(categories_path)
  end


end
