class RemoveNullContraintFromBookmarksSlug < ActiveRecord::Migration
  def change
    change_column :bookmarks, :slug, :string, :null => true, :index => true
  end
end
