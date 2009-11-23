class Semester < ActiveRecord::Base
  file_column :registration_form
  
  
  def self.current
    self.find(:all, :order => "start_date DESC").first
  end
  
end
