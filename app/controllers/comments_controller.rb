class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.owner_id = current_user.id
    @comment.map = Map.find(params[:map_id])
    @comment.save
    if request.xhr?
      render partial: "comment", locals: {comment: @comment}
    else
      redirect_to @comment.map
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment Deleted!"
    else
      flash[:errors] = "Something went wrong"
    end
    redirect_to map_url(params[:map_id])
  end
end
