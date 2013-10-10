class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.save

    if request.xhr?
      render partial: "comment", locals: {comment: @comment}
    else
      redirect_to comments_url
    end
  end
end
