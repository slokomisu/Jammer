class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :swipes
  has_one_attached :clip
  validates :name, presence: true
  validates :instrument, presence: true

  def matches
    matches = []
    swipes = mutual_swipes
    swipes.each do |swipe|
      matches.push(User.find(swipe.user_id))
    end
    matches
  end

  private

  def mutual_swipes
    Swipe.where(swipee_id: self.id, liked: true)
  end
end
