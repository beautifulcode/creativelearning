class Calendar < ActiveRecord::Base
  file_column :file
  
  def self.current
    self.find(:all, :order => "date DESC").first
  end
  
  def month
      self.date.strftime('%B')
  end
  
  def short_month
     self.date.strftime('%b')
  end

  def year
      self.date.strftime('%Y').upcase
  end

  
end
