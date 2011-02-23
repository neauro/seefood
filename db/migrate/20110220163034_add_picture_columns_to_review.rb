class AddPictureColumnsToReview < ActiveRecord::Migration
  def self.up
    add_column :reviews, :picture_file_name, :string
    add_column :reviews, :picture_content_type, :string
    add_column :reviews, :picture_file_size, :integer
    add_column :reviews, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :reviews, :picture_file_name, :string
    remove_column :reviews, :picture_content_type, :string
    remove_column :reviews, :picture_file_size, :integer
    remove_column :reviews, :picture_updated_at, :datetime
  end
end
