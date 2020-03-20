class Api::V1::CommentsController < ApplicationController

  def index
    project = Project.find_by(id: params[:project_id])
    comments = project.comments
    render json: comments, only: [:content, :updated_at, :created_at]
  end

  def create
    user = current_user
    project = Project.find_by(id: params[:projectId])
    comment = Comment.create(comment_params)
    comment.update(user: user, commentable: project)
    render json: comment, include: [:user => {only: [:name]}]
  end

  def show
    comment = Comment.find_by(id: params[:id])
    # binding.pry
    render json: comment
  end

  def update
    # binding.pry
    comment = Comment.find_by(id: params[:id])
    if comment.update(comment_params)
      render json: comment, include: [:user => {only: [:name]}]
    else 
      render json: comment.errors
    end
  end

  def destroy
    # binding.pry
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
