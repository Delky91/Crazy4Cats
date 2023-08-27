class Reaction < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :reaction_type, acceptance: {
    accept: %w[like dislike]
  }

  def self.reaction_type
    %w[like dislike]
  end
end
