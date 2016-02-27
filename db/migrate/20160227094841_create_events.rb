class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :api, index: true, foreign_key: true

      t.string :method

      t.timestamps null: false
    end
  end
end
