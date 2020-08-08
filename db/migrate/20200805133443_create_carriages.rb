class CreateCarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :top_seats
      t.integer :botton_seats
      t.integer :side_top_seats
      t.integer :side_botton_seats
      t.belongs_to :train
      t.string :type

      t.timestamps
    end
  end
end
