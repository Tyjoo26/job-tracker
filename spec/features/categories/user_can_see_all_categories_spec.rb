require 'rails_helper'

describe 'user sees all categories listed' do
  before :each do
    category = Category.create(title: "Comedy")
  end
  scenario 'user sees every category available' do
    visit categories_path

    expect(page.status_code).to eq(200)
    expect(page).to have_content("Comedy")
  end

  scenario 'user can delete a category from the categories page' do
    visit categories_path

    expect(page).to have_content("Delete")
    expect(current_path).to eq(categories_path)
  end
end
