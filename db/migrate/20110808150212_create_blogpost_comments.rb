class CreateBlogpostComments < ActiveRecord::Migration
  def self.up
    create_table :blogpost_comments do |t|
      t.string :author
      t.text :content
      t.references :blogpost

      t.timestamps
    end
  end

  def self.down
    drop_table :blogpost_comments
  end
end
