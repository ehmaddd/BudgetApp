class CreateDealsGroupsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :deals_groups, id: false do |t|
      t.references :deal, foreign_key: true
      t.references :group, foreign_key: true
    end

    add_index :deals_groups, [:deal_id, :group_id], unique: true
  end
end
