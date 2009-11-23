class AddDateToCalendar < ActiveRecord::Migration
  def self.up
    add_column :calendars, :date, :date
  end

  def self.down
    remove_column :calendars, :date
  end
end
