class Publisher < ApplicationRecord
  has_many :books

  # def self.available
  #   where(online: true)
  # end

  scope :available, -> { where(online: true) }
end
