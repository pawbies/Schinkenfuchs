class CreateSites < ActiveRecord::Migration[8.0]
  def change
    create_table :sites do |t|
      t.string :title, null: false
      t.integer :plan, null: false
      t.integer :size, null: false
      t.references :customer, null: true, foreign_key: { to_table: :users }
      t.boolean :accepted, null: false, default: false

      t.timestamps
    end
  end
end
