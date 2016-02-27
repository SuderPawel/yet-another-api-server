class AddBodyToEvent < ActiveRecord::Migration
  def change
    add_column :events, :body, :string
  end
end
