require 'rails_helper'

describe 'user can edit a single category' do
  before :each do
    category = Category.create(title: "Documentary")
  end
  scenario 'user can edit title of category' do
    visit edit_category_path(category)

    fill_in "category[title]", with: "Mockumentary"
    click_button("Update")

    expect(current_path).to eq(category_path(category))
  end
end
