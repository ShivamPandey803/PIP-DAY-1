class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :ledger, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
