class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :stars
      t.text :description
      t.references :menu_item

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
