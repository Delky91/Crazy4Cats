class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions
  has_many :comments, dependent: :destroy

  def count_with_reaction_type(arg)
    number = reactions.where(reaction_type: arg).count
    "#{number} #{arg}s"
  end

  def find_reaction_type_user_relation(user)
    reactions.find_by(user_id: user.id).reaction_type
  end
end
