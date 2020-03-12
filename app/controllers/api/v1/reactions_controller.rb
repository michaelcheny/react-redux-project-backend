class Api::V1::ReactionsController < ApplicationController

  def create
    user = current_user
    project = Project.find_by(id: params[:project])
    reaction = Reaction.create(user_id: user.id, reactable: project, content: params[:like])
    render json: reaction
  end
  
end
