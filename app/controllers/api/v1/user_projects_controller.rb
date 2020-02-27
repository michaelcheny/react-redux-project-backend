class UserProjectsController < ApplicationController

  def create
    user = current_user
    project = Project.find_by(id: params[:project][:id])
    up = user.user_projects.build(project: project)
    if up.save
      render json: up, status: 200
    else
      render json: { message: 'There was an issue.'}, status: 400
    end
  end
  
end
