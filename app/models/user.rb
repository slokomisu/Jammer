# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_attached :clip
  has_one_attached :profile_picture
  validates :name, presence: true
  validates :instrument, presence: true

  def matches
    matches = []

    my_swipe_ids = swipes.map(&:swipee_id)
    mutual_swipes.map(&:user_id).each do |swiper_id|
      matches.push(User.find(swiper_id)) if my_swipe_ids.include? swiper_id
    end
    matches
  end

  def swipes
    Swipe.where(user_id: id)
  end

  private

  def mutual_swipes
    Swipe.where(swipee_id: id, liked: true)
  end
end
