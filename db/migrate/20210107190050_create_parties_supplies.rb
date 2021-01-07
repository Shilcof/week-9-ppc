class CreatePartiesSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :parties_supplies do |t|
      t.belongs_to :party, foreign_key: true
      t.belongs_to :supply, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
