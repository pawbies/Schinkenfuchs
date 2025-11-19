class CreateWebsiteRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :website_requests do |t|
      t.string :title, null: false
      t.integer :plan, null: false
      t.integer :size, null: false
      t.text :description, null: false, limit: 500
      t.string :email_address, null: false
      t.integer :status, default: false

      t.timestamps
    end
  end
end
