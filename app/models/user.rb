class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_array += inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    new_friendship = inverse_friendships.find { |friendship| friendship.user == user }
    new_friendship.confirmed = true
    new_friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def request_exists?(user)
    true if pending_friends.include?(user) || friend_requests.include?(user)
  end
end
