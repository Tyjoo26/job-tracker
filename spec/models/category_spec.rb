require "rails_helper"

describe Category do
  describe "validations" do
    context "invalid input" do
      it "is invalid without title" do
        category =  Category.new()
        expect(category).to be_invalid
      end
    end

      it "must have a unique title" do
        Category.create(title: "Comedy")
        category = Category.new(title: "Comedy")
        expect(category).to be_invalid
      end

    context "valid input" do
      it "can be created with a valid title" do
        category = Category.new(title: "Horror")
        expect(category).to be_valid
      end
    end

    context "relationships" do
      it "has many jobs" do
        category = Category.new(title: 'Tech')
        expect(category).to respond_to(:jobs)
      end
    end

  end
end
