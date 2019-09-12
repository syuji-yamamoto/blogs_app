class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:id])
    @comment = @blog.comments.build(comment_params)
    render :index if @comment.save
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
end
