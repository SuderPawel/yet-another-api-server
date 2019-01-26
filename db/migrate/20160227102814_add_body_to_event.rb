class AddBodyToEvent < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :body, :string
  end
end
