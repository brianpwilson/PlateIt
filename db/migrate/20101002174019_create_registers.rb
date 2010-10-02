class CreateRegisters < ActiveRecord::Migration
  def self.up
    create_table :registers do |t|
      t.string :name
      t.string :password
      t.string :plate
      t.string :state
      t.integer :role

    end
  end

  def self.down
    drop_table :registers
  end
end
