class AddUserToWebsiteRequest < ActiveRecord::Migration[8.0]
  def change
    add_reference :website_requests, :user, null: true, foreign_key: true
  end
end
