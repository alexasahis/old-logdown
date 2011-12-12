class BlogGooglePlusSetting < ActiveRecord::Migration
  def up
    add_column :blogs, :enable_google_plus_one, :boolean, :default => true
    add_column :blogs, :google_plus_one_size, :string, :default => "medium"
    add_column :blogs, :googleplus_user     , :string
    add_column :blogs, :googleplus_hidden   , :boolean, :default => false
  end

  def down
    remove_column :blogs, :enable_google_plus_one     
    remove_column :blogs, :google_plus_one_size
    remove_column :blogs, :googleplus_user     
    remove_column :blogs, :googleplus_hidden   
  end
end
