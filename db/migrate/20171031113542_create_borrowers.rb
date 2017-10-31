class CreateBorrowers < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowers do |t|
      t.string  :name
      t.decimal :summ, precision: 12, scale: 2, default: 0
      t.decimal :norm_rate, precision: 12, scale: 2, default: 0
      t.decimal :over_rate, precision: 12, scale: 2, default: 0
      t.integer :term

      t.timestamps null: false
    end
  end
end
