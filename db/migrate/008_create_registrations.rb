class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :home_phone
      t.string :cell_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
