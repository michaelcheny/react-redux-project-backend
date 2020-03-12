class Api::V1::ProjectsController < ApplicationController

  def index
    if params[:user_id]
      projects = User.find(params[:user_id]).projects
    else
      projects = Project.all.reverse
    end
    # render json: projects, include: [:users => {except: [:created_at, :updated_at]}, :category], status: 200
    render json: projects, include: [
      :users => {except: [:created_at, :updated_at, :password_digest, :id]}, 
      :category => {except: [:created_at, :updated_at, :id]},
      :comments => {only: [:created_at, :content]},
      :reactions => {only: [:reaction_type]}
    ], except: [:category_id], status: 200
  end

  def create
    user = current_user
    category = Category.find_or_create_by(name: params[:category])
    project = Project.new(project_params)
    category.projects << project
    if project.save
      user.user_projects.create(project: project)
      render json: project, include: [:users], status: 200
    else
      render json: { message: "There was an error creating this project" }, status: 400
    end
  end

  def show
    project = Project.find(params[:id])
    render json: project, include: [
      :users => {except: [:created_at, :updated_at, :password_digest]}, 
      :category => {except: [:created_at, :updated_at]},
      :comments => {only: [:created_at, :content]},
      :reactions => {only: [:reaction_type]}
    ], except: [:category_id], status: 200
  end

  def personal
    user = current_user
    render json: user, include: [:projects => {include: [:users, :category]}], only: [:id, :name, :email]
  end
  
  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
  
end
