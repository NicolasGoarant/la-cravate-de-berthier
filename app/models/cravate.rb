class Cravate < ApplicationRecord
  has_many_attached :photos

  validates :name, :reference, :price, presence: true
  validates :stock, numericality: { greater_than_or_equal_to: 0 }

  def available?
    stock.present? && stock > 0
  end
end
