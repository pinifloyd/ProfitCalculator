class AddStartAtToBorrower < ActiveRecord::Migration[5.1]
  def change
    add_column :borrowers, :start_at, :date, null: false, default: Date.current
  end
end
