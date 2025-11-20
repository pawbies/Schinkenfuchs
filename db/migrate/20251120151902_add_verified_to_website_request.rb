class AddVerifiedToWebsiteRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :website_requests, :verified, :boolean, null: false, default: false
  end
end
