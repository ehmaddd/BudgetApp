class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Other Devise columns you may want to add

      t.timestamps null: false, default: Time.now
    end
  end

  def self.down
    remove_index :users, :email
    change_table :users do |t|
      t.remove :email, :encrypted_password, :timestamps
      ## Other Devise columns you may have added
    end
  end
end
