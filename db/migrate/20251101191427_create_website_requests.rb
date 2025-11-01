class CreateWebsiteRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :website_requests do |t|
      t.string :title, null: false
      t.integer :plan, null: false
      t.integer :size, null: false
      t.string :email_address, null: false
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
