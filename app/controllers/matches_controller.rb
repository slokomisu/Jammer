class MatchesController < ApplicationController
  before_action :authenticate_user!
  def index
    swipes = Swipe.where(swipee_id: current_user.id, liked: true)
    @matches = []
    swipes.each do |swipe|
      @matches.push(User.find(swipe.user_id))
    end
    @matches
  end
end
