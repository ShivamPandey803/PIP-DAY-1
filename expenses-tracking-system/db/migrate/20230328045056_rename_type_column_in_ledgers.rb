class RenameTypeColumnInLedgers < ActiveRecord::Migration[6.1]
  def change
    rename_column :ledgers, :type, :transaction_type
  end
end
