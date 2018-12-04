class CreateBillLines < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_lines do |t|
      t.references :bill, foreign_key: true
      t.string :concept

      t.timestamps
    end
  end
end
