require 'rails_helper'
describe 'User creates new Category by filling out form' do
  scenario "a user can create a new category" do

  visit new_category_path

  fill_in "category[title]", with: "Comedy"

  click_button("Create Category")
  expect(current_path).to eq("/categories/#{Category.last.id}")
  expect(page).to have_content("You created a new Comedy category!")
  end
end
