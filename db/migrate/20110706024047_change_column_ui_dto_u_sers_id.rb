class ChangeColumnUiDtoUSersId < ActiveRecord::Migration
  def self.up
		rename_column :bottles, :uid, :user_id
  end

  def self.down
		rename_column :bottles, :user_id, :uid
  end
end
