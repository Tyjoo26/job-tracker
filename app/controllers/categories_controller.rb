class CategoriesController < ApplicationController

  def index
    @companies = Company.all
    @jobs = Job.all
  end

  def show
    #show specific category , they see a list of jobs associated with that category
  end


  def edit
    #if category exists, return to edit page
    #else go to show
  end

  def new
    @category = Category.new
  end

  def create

  end

  def destroy
    #get specific category, perform destroy functionality
    # return to category index with updated index
  end


end
