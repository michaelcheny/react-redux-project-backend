class Api::V1::CategoriesController < ApplicationController

  def index
    category = Category.all
    render json: category, include: [:projects => {include: :users}]
  end

  def show
    category = Category.find_by(id: params[:id])
    render json: category, include: [:projects => {include: :users}]
  end
  
end
