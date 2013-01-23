class AddAccessSettingsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :http_auth, :boolean, :default => false
    add_column :pages, :http_auth_users, :text
  end
end
