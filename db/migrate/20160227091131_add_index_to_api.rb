class AddIndexToApi < ActiveRecord::Migration
  def change
    add_index :apis, :uuid, :unique => true
  end
end
