class AddNewTeacher < ActiveRecord::Migration
  def self.up
    Teacher.create(:name => 'Dawn Pollyck', :description => 'Level 3 Child Care Certificate')
  end

  def self.down
    Teacher.find_by_name('Dawn Pollyck').delete
  end
end
