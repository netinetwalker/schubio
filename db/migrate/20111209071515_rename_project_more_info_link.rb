class RenameProjectMoreInfoLink < ActiveRecord::Migration
  def up
    rename_column :projects, :more_info_link, :source_link
  end

  def down
    rename_column :projects, :source_link, :more_info_link
  end
end
