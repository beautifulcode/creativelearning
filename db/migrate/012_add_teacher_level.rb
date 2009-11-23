class AddTeacherLevel < ActiveRecord::Migration
  def self.up
    add_column :teachers, :aide, :boolean
  end

  def self.down
    remove_column :teachers, :aide
  end
end
