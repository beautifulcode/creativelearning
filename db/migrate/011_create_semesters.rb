class CreateSemesters < ActiveRecord::Migration
  def self.up
    create_table :semesters do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :registration_form

      t.timestamps
    end
  end

  def self.down
    drop_table :semesters
  end
end
