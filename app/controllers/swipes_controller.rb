class SwipesController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def swipe
    swipe = Swipe.create(user_id: current_user.id, swipee_id: params[:swipee_id], liked: params[:liked])
    potential_match = Swipe.where(user_id: swipee_id, swipee_id: current_user.id, liked: true)
    if !potential_match.empty?
      match = User.find(params[:swipee_id])
      flash[:notice] = "You have matched with #{match.name}!"
    end
  end
end
