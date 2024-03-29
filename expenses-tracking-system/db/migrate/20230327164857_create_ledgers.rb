class CreateLedgers < ActiveRecord::Migration[7.0]
  def change
    create_table :ledgers do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.text :description
      t.string :type
      t.float :amount

      t.timestamps
    end
  end
end
