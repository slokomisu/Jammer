class Swipe < ApplicationRecord
  belongs_to :swiper, class_name: 'User', foreign_key: 'user_id'
  belongs_to :swipee, class_name: 'User', foreign_key: 'swipee_id'
  validates :swiper, presence: true
  validates :swipee, presence: true
end
