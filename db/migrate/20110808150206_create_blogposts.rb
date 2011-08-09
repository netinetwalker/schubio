class CreateBlogposts < ActiveRecord::Migration
  def self.up
    create_table :blogposts do |t|
      t.references :author
      t.string :title
      t.string :alias
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :blogposts
  end
end
