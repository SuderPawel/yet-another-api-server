class CreateApis < ActiveRecord::Migration[4.2]
  def change
    create_table :apis do |t|
      t.string :name
      t.string :uuid

      t.timestamps null: false
    end
  end
end
