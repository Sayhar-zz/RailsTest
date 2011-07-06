class CreateBottles < ActiveRecord::Migration
  def self.up
    create_table :bottles do |t|
      t.integer :emo
      t.float :lat
      t.float :long
      t.string :msg
      t.integer :uid
      t.integer :time

      t.timestamps
    end
  end

  def self.down
    drop_table :bottles
  end
end
