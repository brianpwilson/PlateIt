class CreatePlates < ActiveRecord::Migration
  def self.up
    create_table :plates do |t|
      t.string :id
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :plates
  end
end
