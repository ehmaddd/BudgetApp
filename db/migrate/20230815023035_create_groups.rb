class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :icon
      t.datetime :created_at, null: false
      t.references :user, foreign_key: true
    end
  end
end
