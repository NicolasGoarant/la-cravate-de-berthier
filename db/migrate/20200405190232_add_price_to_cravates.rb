class AddPriceToCravates < ActiveRecord::Migration[5.2]
  def change
    add_monetize :cravates, :price, currency: { present: false }

  end
end
