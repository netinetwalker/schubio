class RemoveUnusedFieldsFromBlogposts < ActiveRecord::Migration
  def self.up
    remove_column :blogposts, :author_id
    remove_column :blogposts, :alias
  end

  def self.down
    add_column :blogposts, :author_id, :references
    add_column :blogposts, :alias, :string
  end
end
