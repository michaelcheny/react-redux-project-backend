class Api::V1::ReactionsController < ApplicationController

  def create
    user = current_user
    project = Project.find_by(id: params[:projectId])
    reaction = Reaction.create(user_id: user.id, reactable: project, reaction_type: params[:like])
    # binding.pry
    render json: reaction
  end

  def destroy
    # binding.pry
    reaction = Reaction.find_by(id: params[:id])
    reaction.destroy
    render json: reaction
  end
  
end
