class CategoriesController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @jobs = Job.all
  end

  def show
    @category = Category.find(params[:id])
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

  private

  def category_params
    params.require(:category).permit(:title)
  end


end
