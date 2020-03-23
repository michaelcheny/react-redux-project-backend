class Api::V1::ProjectsController < ApplicationController

  def index
    if params[:user_id]
      projects = User.find(params[:user_id]).projects
    else
      projects = Project.all.reverse
    end
    # render json: projects, include: [:users => {except: [:created_at, :updated_at]}, :category], status: 200
    render json: projects, include: [
      :users => {except: [:created_at, :updated_at, :password_digest]}, 
      :category => {except: [:created_at, :updated_at, :id]},
      :comments => {only: [:created_at, :content, :user_id]},
      :reactions => {only: [:reaction_type, :user_id]}
    ], status: 200
  end

  def create
    user = current_user
    category = Category.find_or_create_by(name: params[:category])
    project = Project.new(project_params)
    project.update(owner_id: user.id)
    category.projects << project
    if project.save
      user.user_projects.create(project: project)
      render json: project, include: [:users], status: 200
      # render json: user, status: 200
    else
      render json: { errors: project.errors.full_messages }, status: 400
    end
  end

  def show
    project = Project.find(params[:id])
    render json: project, include: [
      :users => {except: [:created_at, :updated_at, :password_digest]}, 
      :category => {except: [:created_at, :updated_at]},
      :comments => {only: [:created_at, :content, :user_id, :id, :updated_at], include: [:user => {only: [:name]}]},
      :reactions => {only: [:reaction_type, :user_id, :id]}
    ], except: [:category_id], status: 200
  end

  def update
    user = current_user
    project = Project.find_by(id: params[:id])
    if project.update(project_params)
      render json: project, include: [
        :users => {except: [:created_at, :updated_at, :password_digest]}, 
        :category => {except: [:created_at, :updated_at, :id]},
        :comments => {only: [:created_at, :content, :user_id]},
        :reactions => {only: [:reaction_type, :user_id]}
      ], status: 200
    else
      render json: { errors: project.errors.full_messages}
    end
    
  end

  def personal
    user = current_user
    # binding.pry
    render json: user, include: [
      :projects => {include: [:users, :category, :comments, :reactions]}
      ], only: [:id, :name, :email]
  end

  def newest_projects
    projects = Project.newest_projects
    render json: projects
  end
  
  private

  def project_params
    params.require(:project).permit(:name, :description, :online, :team_size)
  end
  
end
