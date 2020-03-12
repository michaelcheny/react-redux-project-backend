class Api::V1::CommentsController < ApplicationController


  def create
    user = current_user
    project = Project.find_by(id: params[:project])
    Comment.create(user_id: user.id, commentable: project, content: params[:content])
  end
  
end
