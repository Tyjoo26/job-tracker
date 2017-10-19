require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.create!(title: "HR")
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        category = Category.create!(title: "HR")
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver",category: category)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        category = Category.create!(title: "HR")
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80,category: category)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        category = Category.create!(title: "HR")
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      category = Category.create!(title: "HR")
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", category: category)
      expect(job).to respond_to(:company)
    end
  end

  describe '.count_of_jobs_by_level_of_interest' do
    it "returns count of jobs with specific level of interest for one job" do
      category = Category.create!(title: "HR")
      company = Company.create!(name: "ESPN")
      job = Job.create!(title: "Software", level_of_interest: 70, description: "Wahoo", city: "Denver", category: category, company: company)
      expect(Job.count_of_jobs_by_level_of_interest).to eq({70 => 1})
    end

    it "retuns count of jobs by level of interest for two different jobs" do
      category = Category.create!(title: "HR")
      company = Company.create!(name: "ESPN")
      job1 = Job.create!(title: "Software", level_of_interest: 70, description: "Wahoo", city: "Denver", category: category, company: company)
      job2 = Job.create!(title: "Software", level_of_interest: 4, description: "Wahoo", city: "Denver", category: category, company: company)
      expect(Job.count_of_jobs_by_level_of_interest).to eq({job1.level_of_interest => 1, job2.level_of_interest => 1})
    end
  end
end
