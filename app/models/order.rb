class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cravate

  monetize :amount_cents
end
