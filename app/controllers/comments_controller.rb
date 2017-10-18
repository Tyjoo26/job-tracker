class CommentsController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)

    if @comment.save
      flash[:success] = "Comment saved!"
      redirect_to company_job_path(@job.company, @comment.job)
    else
      flash[:success] = "Comment not saved try again"
      redirect_to company_job_path(@job.company, @comment.job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit( :body)
  end

end
