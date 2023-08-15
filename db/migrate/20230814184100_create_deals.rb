class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :created_at
    end
  end
end
