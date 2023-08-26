class Comment < ApplicationRecord
  belongs_to :post

  validates :author, length: { maximum: 20 }
  validates :content, presence: true, length: { minimum: 2, maximum: 300 }

  before_validation :set_default_author

  private

  def set_default_author
    self.author = 'anónimo' if author.blank?
  end
end
