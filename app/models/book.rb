class Book < ApplicationRecord
  #validations
  validates :title,:published_at, presence: true
  validates :isbn, :isbn13, presence: true, uniqueness: true 
  validates :list_price, :sell_price, :page_num, numericality: { greater_than: 0 }

  # relationships
  belongs_to :publisher # publisher_id
  belongs_to :category
  has_one_attached :cover_image
  has_many :comments

  # scopes
  scope :available, -> { where(on_sell: true).where('list_price > 0') }
end
