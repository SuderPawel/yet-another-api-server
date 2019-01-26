class AddIndexToApi < ActiveRecord::Migration[4.2]
  def change
    add_index :apis, :uuid, :unique => true
  end
end
