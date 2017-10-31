class CreateBorrowerPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :borrower_periods do |t|
      t.integer :borrower_id
      t.decimal :summ, precision: 12, scale: 2, default: 0
      t.string  :state, index: true

      t.timestamps null: false
    end
  end
end
