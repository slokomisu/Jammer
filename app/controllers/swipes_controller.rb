class SwipesController < ApplicationController
  before_action :authenticate_user!
  def index
    potential_stack = User.where.not(id: current_user.id)
    already_swipped = current_user.swipes.map(&:swipee)
    already_swipped_ids = already_swipped.map(&:id)
    stack = potential_stack.reject { |user| already_swipped_ids.include? user.id }
    @swipee = stack.first
  end

  def swipe
    swipe = Swipe.create(user_id: current_user.id, swipee_id: params[:swipee_id], liked: params[:liked])
    potential_match = Swipe.where(user_id: params[:swipee_id], swipee_id: current_user.id, liked: true)
    if !potential_match.empty?
      match = User.find(params[:swipee_id])
      flash[:notice] = "You have matched with #{match.name}!"
      flash.keep
    end
    redirect_to swipes_path
  end
end
