class Publisher < ApplicationRecord

  validates :name, presence: true
  has_many :books

  # def self.available
  #   where(online: true)
  # end

  scope :available, -> { where(online: true) }
end
