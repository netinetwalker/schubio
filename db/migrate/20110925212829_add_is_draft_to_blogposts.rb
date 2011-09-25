class AddIsDraftToBlogposts < ActiveRecord::Migration
  def self.up
    add_column :blogposts, :is_draft, :boolean
  end

  def self.down
    remove_column :blogposts, :is_draft
  end
end
