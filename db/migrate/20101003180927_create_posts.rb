class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :plate
      t.integer :from
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
