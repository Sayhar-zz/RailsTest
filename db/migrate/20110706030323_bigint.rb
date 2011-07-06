class Bigint < ActiveRecord::Migration
  def self.up
		change_column :bottles, :time, :integer, :limit =>8
  end

  def self.down

  end
end
