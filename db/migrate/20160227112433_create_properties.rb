class CreateProperties < ActiveRecord::Migration[4.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :source
      t.string :value

      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
