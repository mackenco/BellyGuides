class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.owner_id = current_user.id
    @comment.map_id = params[:map_id]
    @comment.save
    if request.xhr?
      render partial: "comment", locals: {comment: @comment}
    else
      redirect_to map_url(params[:map_id])
    end
  end
end
