class Api::V1::CommentsController < ApplicationController


  def create
    user = current_user
    project = Project.find_by(id: params[:project])
    comment = Comment.create(user_id: user.id, commentable: project, content: params[:content])
    render json: comment
  end
  
end
