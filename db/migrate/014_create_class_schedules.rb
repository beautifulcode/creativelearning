class CreateClassSchedules < ActiveRecord::Migration
  def self.up
    create_table :class_schedules do |t|
      t.string :age
      t.time :start_time
      t.time :end_time
      t.string :cost
      t.string :occurs_on

      t.timestamps
    end
  end

  def self.down
    drop_table :class_schedules
  end
end
