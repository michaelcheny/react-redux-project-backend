class Api::V1::CommentsController < ApplicationController


  def create
    user = current_user
    project = Project.find_by(id: params[:projectId])
    # comment = Comment.create(user_id: user.id, commentable: project, content: comment_params)
    comment = Comment.create(comment_params)
    # binding.pry
    comment.update(user: user, commentable: project)
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
