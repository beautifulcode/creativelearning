class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :home_phone
      t.string :cell_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
