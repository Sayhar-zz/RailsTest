class LatLongAreNowInts < ActiveRecord::Migration

def self.up
    remove_column :bottles, :long
    remove_column :bottles, :lat
    add_column :bottles, :long, :integer
    add_column :bottles, :lat, :integer
  end

  def self.down
    change_column :bottles, :long, :float
    change_column :bottles, :lat, :float
  end
end


