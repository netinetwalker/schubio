class AddEmailToBlogpostComments < ActiveRecord::Migration
  def self.up
    add_column :blogpost_comments, :email, :string
  end

  def self.down
    remove_column :blogpost_comments, :email
  end
end
