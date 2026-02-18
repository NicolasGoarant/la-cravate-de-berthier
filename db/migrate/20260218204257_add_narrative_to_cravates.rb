class AddNarrativeToCravates < ActiveRecord::Migration[7.1]
  def change
    add_column :cravates, :story, :text
    add_column :cravates, :when_to_wear, :text
    add_column :cravates, :berthier_quote, :string
  end
end
