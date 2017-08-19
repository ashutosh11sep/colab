class Post < ApplicationRecord
 
has_many :taggings
has_many :users, through: :taggings

has_many :endorsements
has_many :payements



 acts_as_votable
def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (:followed_user_ids) OR user_id = :user_id",
          followed_user_ids: followed_user_ids, user_id: user)
  end


end