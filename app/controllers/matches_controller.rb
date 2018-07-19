class MatchesController < ApplicationController
  before_action :authenticate_user!
  def index
    @swipes = Swipe.where(swipee_id: current_user.id, liked: true)
  end
end
