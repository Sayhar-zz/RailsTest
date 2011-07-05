class CreateBottles < ActiveRecord::Migration
  def self.up
    create_table :bottles do |t|
      t.integer :emo
      t.float :lat
      t.float :long
      t.text :msg
      t.integer :uid
      t.integer :time, :limit => 8

      t.timestamps
    end
	
  end

  def self.down
    drop_table :bottles
  end
end
