class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :teaser_image
      t.string :short_description
      t.text :description
      t.string :more_info_link

      t.timestamps
    end
  end
end
