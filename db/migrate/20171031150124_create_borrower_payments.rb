class CreateBorrowerPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :borrower_payments do |t|
      t.integer :borrower_id
      t.decimal :summ, precision: 12, scale: 2, default: 0
      t.date    :payed_at

      t.timestamps null: false
    end
  end
end
