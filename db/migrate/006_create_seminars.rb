class CreateSeminars < ActiveRecord::Migration
  def self.up
    create_table :seminars do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :file

      t.timestamps
    end
  end

  def self.down
    drop_table :seminars
  end
end
